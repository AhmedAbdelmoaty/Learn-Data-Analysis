<?php
$page_title = 'Site Settings';
require_once __DIR__ . '/includes/header.php';

$success = '';
$error = '';

$stmt = $pdo->query("SELECT * FROM site_settings");
$settings_rows = $stmt->fetchAll();
$settings = [];
foreach ($settings_rows as $row) {
    $settings[$row['setting_key']] = $row['setting_value'];
}

$themeDefaults = [
    'primary_color' => '#A8324E',
    'secondary_color' => '#6C1E35',
    'primary_opacity' => '90',
    'text_dark' => '#333333',
    'text_light' => '#666666',
    'font_family_en' => "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
    'font_family_ar' => "'Tajawal', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
    'font_link_en' => '',
    'font_link_ar' => '',
];

if (!array_key_exists('admin_email', $settings)) {
    $settings['admin_email'] = '';
}

foreach ($themeDefaults as $key => $value) {
    if (!array_key_exists($key, $settings)) {
        $settings[$key] = $value;
    }
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $fields = [
            'site_name_en' => trim($_POST['site_name_en'] ?? ''),
            'site_name_ar' => trim($_POST['site_name_ar'] ?? ''),
            'logo' => trim($_POST['logo'] ?? ''),
            'admin_email' => trim($_POST['admin_email'] ?? ''),
        ];

        $fields['primary_color'] = normalizeHexColor($_POST['primary_color'] ?? null, $themeDefaults['primary_color']);
        $fields['secondary_color'] = normalizeHexColor($_POST['secondary_color'] ?? null, $themeDefaults['secondary_color']);
        $fields['text_dark'] = normalizeHexColor($_POST['text_dark'] ?? null, $themeDefaults['text_dark']);
        $fields['text_light'] = normalizeHexColor($_POST['text_light'] ?? null, $themeDefaults['text_light']);
        $fields['primary_opacity'] = (string)clampOpacityValue($_POST['primary_opacity'] ?? $themeDefaults['primary_opacity'], (int)$themeDefaults['primary_opacity']);
        $fields['font_family_en'] = sanitizeFontStack($_POST['font_family_en'] ?? null, $themeDefaults['font_family_en']);
        $fields['font_family_ar'] = sanitizeFontStack($_POST['font_family_ar'] ?? null, $themeDefaults['font_family_ar']);
        $fields['font_link_en'] = filter_var(trim($_POST['font_link_en'] ?? ''), FILTER_VALIDATE_URL) ?: '';
        $fields['font_link_ar'] = filter_var(trim($_POST['font_link_ar'] ?? ''), FILTER_VALIDATE_URL) ?: '';

        $updateStmt = $pdo->prepare("UPDATE site_settings SET setting_value = ? WHERE setting_key = ?");
        $insertStmt = $pdo->prepare("INSERT INTO site_settings (setting_key, setting_value) VALUES (?, ?)");

        foreach ($fields as $key => $value) {
            $updateStmt->execute([$value, $key]);
            if ($updateStmt->rowCount() === 0) {
                $insertStmt->execute([$key, $value]);    
            }
            $settings[$key] = $value;
        }
        
        $success = 'Settings updated successfully!';
    } catch (PDOException $e) {
        $error = 'Error updating settings: ' . $e->getMessage();
    }
}

$logoValue = $settings['logo'] ?? '';
$logoPreview = '';
if (!empty($logoValue)) {
    if (preg_match('/^https?:\/\//i', $logoValue) || strpos($logoValue, '//') === 0 || strpos($logoValue, '/') === 0) {
        $logoPreview = $logoValue;
    } else {
        $logoPreview = '../' . ltrim($logoValue, '/');
    }
}
?>

<div class="content-card">
    <?php if ($success): ?>
        <div class="alert alert-success"><i class="fas fa-check-circle"></i> <?php echo $success; ?></div>
    <?php endif; ?>
    <?php if ($error): ?>
        <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <?php echo $error; ?></div>
    <?php endif; ?>
    
    <form method="POST">
        <h5 class="mb-3">Site Identity</h5>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Site Name (English)</label>
                <input type="text" class="form-control" name="site_name_en" value="<?php echo htmlspecialchars($settings['site_name_en'] ?? ''); ?>" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">اسم الموقع (عربي)</label>
                <input type="text" class="form-control" name="site_name_ar" value="<?php echo htmlspecialchars($settings['site_name_ar'] ?? ''); ?>" required dir="rtl">
            </div>
        </div>

        

        <h5 class="mb-3 mt-4">Brand Assets</h5>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Logo</label>
                <div class="input-group">
                    <input type="url" class="form-control" id="logo_url" name="logo" value="<?php echo htmlspecialchars($settings['logo'] ?? ''); ?>">
                    <button type="button" class="btn btn-outline-secondary btn-choose-media" onclick="openMediaPicker('logo_url', 'logo_preview')">
                        <i class="fas fa-images"></i> Choose
                    </button>
                </div>
                <div id="logo_preview" class="image-preview-box <?php echo !empty($logoPreview) ? 'active' : ''; ?> mt-2">
                <?php if (!empty($logoPreview)): ?>
                    <img src="<?php echo htmlspecialchars($logoPreview); ?>" alt="Logo Preview">
                <?php else: ?>
                    <img src="" alt="Logo Preview">
                <?php endif; ?>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Primary Color</label>
                <input type="color" class="form-control" name="primary_color" value="<?php echo htmlspecialchars($settings['primary_color'] ?? $themeDefaults['primary_color']); ?>">
            </div>
        </div>

        <h5 class="mb-3 mt-4">Theme Colors</h5>
        <div class="row">
            <div class="col-md-3 mb-3">
                <label class="form-label">Secondary Color</label>
                <input type="color" class="form-control" name="secondary_color" value="<?php echo htmlspecialchars($settings['secondary_color'] ?? $themeDefaults['secondary_color']); ?>">
            </div>
            <div class="col-md-3 mb-3">
                <label class="form-label">Text Color (Dark)</label>
                <input type="color" class="form-control" name="text_dark" value="<?php echo htmlspecialchars($settings['text_dark'] ?? $themeDefaults['text_dark']); ?>">
            </div>
            <div class="col-md-3 mb-3">
                <label class="form-label">Text Color (Muted)</label>
                <input type="color" class="form-control" name="text_light" value="<?php echo htmlspecialchars($settings['text_light'] ?? $themeDefaults['text_light']); ?>">
            </div>
            <div class="col-md-3 mb-3">
                <label class="form-label">Overlay Opacity (%)</label>
                <input type="range" class="form-range" name="primary_opacity" id="primaryOpacityRange" min="0" max="100" value="<?php echo htmlspecialchars($settings['primary_opacity'] ?? $themeDefaults['primary_opacity']); ?>" oninput="document.getElementById('primaryOpacityValue').textContent = this.value;">
                <div class="form-text">Current: <span id="primaryOpacityValue"><?php echo htmlspecialchars($settings['primary_opacity'] ?? $themeDefaults['primary_opacity']); ?></span>%</div>
            </div>
        </div>

        <h5 class="mb-3 mt-4">Typography</h5>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Primary Font Stack (English)</label>
                <input type="text" class="form-control" name="font_family_en" value="<?php echo htmlspecialchars($settings['font_family_en'] ?? $themeDefaults['font_family_en']); ?>">
                <div class="form-text">Enter a CSS font-family stack. Example: 'Poppins', sans-serif</div>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Primary Font Stack (Arabic)</label>
                <input type="text" class="form-control" name="font_family_ar" value="<?php echo htmlspecialchars($settings['font_family_ar'] ?? $themeDefaults['font_family_ar']); ?>">
                <div class="form-text">Include fonts that support Arabic characters. Example: 'Tajawal', 'Cairo', sans-serif</div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Font Import URL (English) <span class="text-muted">Optional</span></label>
                <input type="url" class="form-control" name="font_link_en" value="<?php echo htmlspecialchars($settings['font_link_en'] ?? ''); ?>" placeholder="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap">
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Font Import URL (Arabic) <span class="text-muted">Optional</span></label>
                <input type="url" class="form-control" name="font_link_ar" value="<?php echo htmlspecialchars($settings['font_link_ar'] ?? ''); ?>" placeholder="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;700&display=swap">
            </div>
        </div>
        
        <h5 class="mb-3 mt-4">Contact Form Notifications</h5>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Recipient Email</label>
                <input type="email" class="form-control" name="admin_email" value="<?php echo htmlspecialchars($settings['admin_email'] ?? ''); ?>" placeholder="team@company.com">
                <small class="text-muted">Contact form submissions will be emailed to this address.</small>
            </div>
        </div>
        
        <button type="submit" class="btn btn-primary" name="submit">
            <i class="fas fa-save"></i> Save Settings
        </button>
    </form>
</div>

<?php require_once 'includes/footer.php'; ?>
