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

if (!array_key_exists('admin_email', $settings)) {
    $settings['admin_email'] = '';
}
if (!array_key_exists('primary_color', $settings)) {
    $settings['primary_color'] = '#a8324e';
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $fields = [
            'site_name_en' => trim($_POST['site_name_en'] ?? ''),
            'site_name_ar' => trim($_POST['site_name_ar'] ?? ''),
            'logo' => trim($_POST['logo'] ?? ''),
            'primary_color' => trim($_POST['primary_color'] ?? ''),
            'admin_email' => trim($_POST['admin_email'] ?? ''),
        ];

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
                <input type="color" class="form-control" name="primary_color" value="<?php echo htmlspecialchars($settings['primary_color'] ?? '#a8324e'); ?>">
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
