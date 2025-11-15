<?php
require_once 'includes/db.php';

$lang = isset($_GET['lang']) && $_GET['lang'] === 'ar' ? 'ar' : 'en';
$is_rtl = ($lang === 'ar');
$slug = $_GET['slug'] ?? '';
$tools_url = 'tools.php' . ($lang === 'ar' ? '?lang=ar' : '');

if ($slug === '') {
    header('Location: ' . $tools_url);
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM topics WHERE slug = ?");
$stmt->execute([$slug]);
$topic = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$topic || !$topic['is_tool']) {
    header('Location: ' . $tools_url);
    exit;
}

$page_title = $topic['title_' . $lang] . ' - Learn Data Analysis';

$stmt = $pdo->prepare("SELECT * FROM content_items WHERE topic_id = ? AND status = 'published' ORDER BY display_order, id");
$stmt->execute([$topic['id']]);
$content_items = $stmt->fetchAll(PDO::FETCH_ASSOC);
require_once 'includes/site_header.php';

$hero_image = $topic['hero_image'] ?? '';
$hero_alt = $topic['title_' . $lang] ?? ($lang === 'en' ? 'Tool hero image' : 'صورة الأداة');
$text_column_classes = $is_rtl ? 'order-lg-2 text-lg-end' : 'order-lg-1 text-lg-start';
$image_column_classes = $is_rtl ? 'order-lg-1' : 'order-lg-2';
?>

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
                             class="img-fluid rounded shadow">
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>

<?php if (count($content_items) > 0): ?>
<section class="py-5">
    <div class="container">
        <h2 class="section-title text-center mb-5"><?php echo $lang === 'en' ? 'Learn More' : 'تعلم المزيد'; ?></h2>
        <div class="row g-4">
            <?php foreach ($content_items as $item): ?>
                <div class="col-12 col-md-6 col-lg-4">
                    <a href="<?php echo preserveLang('content.php?topic=' . urlencode($topic['slug']) . '&slug=' . urlencode($item['slug']), $lang); ?>"
                       class="text-decoration-none">
                        <div class="content-item-card h-100">
                            <?php if (!empty($item['hero_image'])): ?>
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

<?php include 'includes/contact_form_component.php'; ?>

<?php require_once 'includes/site_footer.php'; ?>
