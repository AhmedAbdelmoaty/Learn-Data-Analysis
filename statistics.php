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
<section class="py-5 hero-split-section">
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
                             class="img-fluid section-image-frame">
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
