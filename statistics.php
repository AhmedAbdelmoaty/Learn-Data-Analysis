<?php
require_once 'includes/db.php';

$lang = isset($_GET['lang']) && $_GET['lang'] === 'ar' ? 'ar' : 'en';
$is_rtl = ($lang === 'ar');
$topic_slug = 'statistics';

// Load header
require_once 'includes/site_header.php';

// Get topic information
$stmt = $pdo->prepare("SELECT * FROM topics WHERE slug = ?");
$stmt->execute([$topic_slug]);
$topic = $stmt->fetch();

if (!$topic) {
    header('Location: index.php?lang=' . $lang);
    exit;
}

$hero_style = '';

if (!function_exists('lda_hex_to_rgba')) {
    function lda_hex_to_rgba(?string $hex, $opacity = 100): ?string
    {
        if (!$hex) {
            return null;
        }

        $hex = ltrim($hex, '#');
        if (strlen($hex) === 3) {
            $hex = $hex[0] . $hex[0] . $hex[1] . $hex[1] . $hex[2] . $hex[2];
        }

        if (strlen($hex) !== 6) {
            return null;
        }

        $r = hexdec(substr($hex, 0, 2));
        $g = hexdec(substr($hex, 2, 2));
        $b = hexdec(substr($hex, 4, 2));
        $opacity = max(0, min(100, (int)$opacity)) / 100;

        return sprintf('rgba(%d, %d, %d, %.2f)', $r, $g, $b, $opacity);
    }
}

if (!function_exists('lda_build_topic_hero_style')) {
    function lda_build_topic_hero_style(array $topic): string
    {
        $styles = [];

        $backgroundColor = $topic['hero_background_color'] ?? '';
        $backgroundOpacity = $topic['hero_background_opacity'] ?? null;

        if (is_string($backgroundColor) && preg_match('/^#([0-9a-fA-F]{3}){1,2}$/', $backgroundColor)) {
            $rgba = lda_hex_to_rgba($backgroundColor, $backgroundOpacity ?? 85);
            if ($rgba) {
                $styles[] = '--hero-background-color: ' . $rgba;
            }
            $styles[] = '--hero-background-solid: ' . strtolower($backgroundColor);
        }

        $textColor = $topic['hero_text_color'] ?? '';
        if (is_string($textColor) && preg_match('/^#([0-9a-fA-F]{3}){1,2}$/', $textColor)) {
            $color = strtolower($textColor);
            $styles[] = '--hero-title-color: ' . $color;
            $styles[] = '--hero-subtitle-color: ' . $color;
            $styles[] = '--hero-body-color: ' . $color;
        }

        return $styles ? htmlspecialchars(implode('; ', $styles), ENT_QUOTES, 'UTF-8') : '';
    }
}

$hero_style = lda_build_topic_hero_style($topic);

$page_title = $topic['title_' . $lang] . ' - Learn Data Analysis';

// Get content items for this topic
$stmt = $pdo->prepare("SELECT * FROM content_items WHERE topic_id = ? AND status = 'published' ORDER BY display_order");
$stmt->execute([$topic['id']]);
$content_items = $stmt->fetchAll();

$hero_image = $topic['hero_image'] ?? '';
$hero_alt = $topic['title_' . $lang] ?? ($lang === 'en' ? 'Statistics hero image' : 'صورة قسم الإحصاء');
$text_column_classes = $is_rtl ? 'order-lg-2 text-lg-end' : 'order-lg-1 text-lg-start';
$image_column_classes = $is_rtl ? 'order-lg-1' : 'order-lg-2';
?>

<!-- Topic Hero -->
<section class="py-5 hero-split-section"<?php echo $hero_style ? ' style="' . $hero_style . '"' : ''; ?>>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0 <?php echo $text_column_classes; ?> text-center">
                <h1 class="display-4 fw-bold mb-4 hero-title"><?php echo htmlspecialchars($topic['title_' . $lang]); ?></h1>
                <?php if (!empty($topic['intro_' . $lang])): ?>
                    <p class="lead mb-0 hero-subtitle"><?php echo nl2br(htmlspecialchars($topic['intro_' . $lang])); ?></p>
                <?php endif; ?>
            </div>
            <?php if (!empty($hero_image)): ?>
                <div class="col-lg-6 <?php echo $image_column_classes; ?> text-center">
                    <div class="hero-image-wrapper">
                        <img src="<?php echo htmlspecialchars($hero_image); ?>"
                             alt="<?php echo htmlspecialchars($hero_alt); ?>"
                             class="img-fluid rounded shadow">
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>

<!-- Content Items Grid -->
<?php if (count($content_items) > 0): ?>
<section class="py-5">
    <div class="container">
        <h2 class="section-title text-center mb-5"><?php echo $lang === 'en' ? 'Learn More' : 'تعلم المزيد'; ?></h2>
        <div class="row g-4">
            <?php foreach ($content_items as $item): ?>
                <div class="col-12 col-md-6 col-lg-4">
                    <a href="content.php?topic=<?php echo urlencode($topic_slug); ?>&slug=<?php echo urlencode($item['slug']); ?>&lang=<?php echo $lang; ?>"
                       class="text-decoration-none">
                        <div class="content-item-card h-100">
                            <?php if ($item['hero_image']): ?>
                                <img src="<?php echo htmlspecialchars($item['hero_image']); ?>" 
                                     class="card-img-top" 
                                     alt="<?php echo htmlspecialchars($item['title_' . $lang]); ?>"
                                     style="height: 200px; object-fit: cover;">
                            <?php endif; ?>
                            <div class="card-body">
                                <h5 class="card-title"><?php echo htmlspecialchars($item['title_' . $lang]); ?></h5>
                                <?php $summaryText = getCardSummaryText($item, $lang); ?>
                                <p class="card-text text-muted card-text-limit"><?php echo htmlspecialchars($summaryText); ?></p>
                                <span class="btn btn-primary btn-sm"><?php echo t('read_more', $lang); ?> →</span>
                            </div>
                        </div>
                    </a>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>
<?php endif; ?>

<!-- Contact Form at Bottom -->
<?php include 'includes/contact_form_component.php'; ?>

<?php require_once 'includes/site_footer.php'; ?>
