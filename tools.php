<?php
require_once 'includes/db.php';

$lang = isset($_GET['lang']) && $_GET['lang'] === 'ar' ? 'ar' : 'en';
$is_rtl = ($lang === 'ar');
$page_title = ($lang === 'en' ? 'Tools' : 'الأدوات') . ' - Learn Data Analysis';

require_once 'includes/site_header.php';

// Load page sections for Tools page
$stmt = $pdo->prepare("SELECT * FROM page_sections WHERE page_name = 'tools'");
$stmt->execute();
$tools_sections = [];
foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $section) {
    $tools_sections[$section['section_key']] = $section;
}

$hero_section = $tools_sections['hero'] ?? null;
$intro_section = $tools_sections['intro'] ?? null;

// Fetch published tools
$stmt = $pdo->prepare("SELECT * FROM topics WHERE is_tool = true ORDER BY display_order, title_en");
$stmt->execute();
$tool_topics = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<?php if ($hero_section && (!isset($hero_section['is_enabled']) || $hero_section['is_enabled'])):
    $hero_image = $hero_section['image'] ?? '';
    $hero_alt = $hero_section['title_' . $lang] ?? ($lang === 'en' ? 'Tools overview' : 'نظرة عامة على الأدوات');
    $text_column_classes = $is_rtl ? 'order-lg-2 text-lg-end' : 'order-lg-1 text-lg-start';
    $image_column_classes = $is_rtl ? 'order-lg-1' : 'order-lg-2';
?>
<section class="py-5 hero-split-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0 <?php echo $text_column_classes; ?> text-center">
                <h1 class="display-4 fw-bold mb-4 hero-title"><?php echo htmlspecialchars($hero_section['title_' . $lang] ?? ($lang === 'en' ? 'Explore Our Tools' : 'استكشف الأدوات المتاحة')); ?></h1>
                <?php if (!empty($hero_section['subtitle_' . $lang])): ?>
                    <p class="lead mb-0 hero-subtitle"><?php echo nl2br(htmlspecialchars($hero_section['subtitle_' . $lang])); ?></p>
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
<?php endif; ?>

<?php if ($intro_section && (!isset($intro_section['is_enabled']) || $intro_section['is_enabled'])): ?>
<section class="py-5 bg-light">
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="col-lg-8">
                <h2 class="section-title mb-3"><?php echo htmlspecialchars($intro_section['title_' . $lang] ?? ''); ?></h2>
                <?php if (!empty($intro_section['body_' . $lang])): ?>
                    <p class="lead text-muted"><?php echo nl2br(htmlspecialchars($intro_section['body_' . $lang])); ?></p>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>
<?php endif; ?>

<section class="py-5">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="section-title mb-0"><?php echo t('explore_tools', $lang); ?></h2>
        </div>

        <?php if (count($tool_topics) === 0): ?>
            <div class="alert alert-info text-center">
                <?php echo $lang === 'en' ? 'No tools are available at the moment. Please check back later.' : 'لا توجد أدوات متاحة حاليًا. يرجى العودة لاحقًا.'; ?>
            </div>
        <?php else: ?>
            <div class="row g-4">
                <?php foreach ($tool_topics as $tool): ?>
                    <div class="col-md-6 col-lg-4">
                        <div class="topic-card h-100 p-4 text-center">
                            <div class="topic-image mb-3" style="height: 180px; overflow: hidden; border-radius: 12px;">
                                <img src="<?php echo htmlspecialchars($tool['hero_image'] ?: 'https://via.placeholder.com/600x400'); ?>"
                                     alt="<?php echo htmlspecialchars($tool['title_' . $lang]); ?>"
                                     class="img-fluid w-100 h-100" style="object-fit: cover;">
                            </div>
                            <h5 class="mb-2"><?php echo htmlspecialchars($tool['title_' . $lang]); ?></h5>
                            <p class="text-muted mb-4 card-text-limit">
                                <?php
                                    $introText = $tool['intro_' . $lang] ?? '';
                                    if (function_exists('mb_strimwidth')) {
                                        $introText = mb_strimwidth($introText, 0, 160, '...');
                                    } else {
                                        $introText = strlen($introText) > 160 ? substr($introText, 0, 157) . '...' : $introText;
                                    }
                                    echo htmlspecialchars($introText);
                                ?>
                            </p>
                            <a href="<?php echo preserveLang('tool.php?slug=' . urlencode($tool['slug']), $lang); ?>" class="btn btn-primary">
                                <?php echo t('view_tool', $lang); ?>
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>

<?php include 'includes/contact_form_component.php'; ?>

<?php require_once 'includes/site_footer.php'; ?>
