<?php
$page_title = 'Manage Topics & Tools';
require_once __DIR__ . '/includes/header.php';

$success = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'add') {
        try {
            $stmt = $pdo->prepare("INSERT INTO topics (slug, title_en, title_ar, intro_en, intro_ar, hero_image, display_order, is_tool) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([
                trim($_POST['slug'] ?? ''),
                trim($_POST['title_en'] ?? ''),
                trim($_POST['title_ar'] ?? ''),
                trim($_POST['intro_en'] ?? ''),
                trim($_POST['intro_ar'] ?? ''),
                trim($_POST['hero_image'] ?? ''),
                (int)($_POST['display_order'] ?? 0),
                isset($_POST['is_tool']) ? 1 : 0,
            ]);
            $success = 'Topic created successfully!';
        } catch (PDOException $e) {
            $error = 'Error creating topic: ' . $e->getMessage();
        }
    } elseif ($action === 'update') {
        try {
            $stmt = $pdo->prepare("UPDATE topics SET slug = ?, title_en = ?, title_ar = ?, intro_en = ?, intro_ar = ?, hero_image = ?, display_order = ?, is_tool = ? WHERE id = ?");
            $stmt->execute([
                trim($_POST['slug'] ?? ''),
                trim($_POST['title_en'] ?? ''),
                trim($_POST['title_ar'] ?? ''),
                trim($_POST['intro_en'] ?? ''),
                trim($_POST['intro_ar'] ?? ''),
                trim($_POST['hero_image'] ?? ''),
                (int)($_POST['display_order'] ?? 0),
                isset($_POST['is_tool']) ? 1 : 0,
                (int)($_POST['id'] ?? 0),
            ]);
            $success = 'Topic updated successfully!';
        } catch (PDOException $e) {
            $error = 'Error updating topic: ' . $e->getMessage();
        }
    } elseif ($action === 'delete') {
        $topic_id = (int)($_POST['id'] ?? 0);
        try {
            $stmt = $pdo->prepare("SELECT is_tool FROM topics WHERE id = ?");
            $stmt->execute([$topic_id]);
            $topic_row = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$topic_row) {
                $error = 'Topic not found.';
            } elseif ((int)$topic_row['is_tool'] !== 1) {
                $error = 'Only tool topics can be deleted from this screen.';
            } else {
                $stmt = $pdo->prepare("DELETE FROM topics WHERE id = ?");
                $stmt->execute([$topic_id]);
                $success = 'Topic deleted successfully!';
            }
        } catch (PDOException $e) {
            $error = 'Error deleting topic: ' . $e->getMessage();
        }
    }
}

$stmt = $pdo->query("SELECT * FROM topics ORDER BY display_order, title_en");
$topics = $stmt->fetchAll(PDO::FETCH_ASSOC);

$stmt = $pdo->query("SELECT * FROM uploads ORDER BY uploaded_at DESC");
$media_files = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="content-card">
    <?php if ($success): ?>
        <div class="alert alert-success"><i class="fas fa-check-circle"></i> <?php echo $success; ?></div>
    <?php endif; ?>
    <?php if ($error): ?>
        <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <?php echo $error; ?></div>
    <?php endif; ?>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h5 class="mb-1">Topics & Tool Pages</h5>
            <p class="text-muted mb-0">Use this area to add new tools, edit existing topics, and control their order and hero imagery.</p>
        </div>
    </div>

    <div class="card mb-5">
        <div class="card-header bg-light">
            <strong><i class="fas fa-plus-circle"></i> Add New Topic / Tool</strong>
        </div>
        <div class="card-body">
            <form method="POST">
                <input type="hidden" name="action" value="add">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Slug (URL)</label>
                        <input type="text" class="form-control" name="slug" placeholder="e.g. python" required>
                        <small class="text-muted">Used in URLs. Use lowercase letters, numbers, and dashes only.</small>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Title (English)</label>
                        <input type="text" class="form-control" name="title_en" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label class="form-label">Title (Arabic)</label>
                        <input type="text" class="form-control" name="title_ar" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Intro (English)</label>
                        <textarea class="form-control" name="intro_en" rows="3" required></textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Intro (Arabic)</label>
                        <textarea class="form-control" name="intro_ar" rows="3" required></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Hero Image URL</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="hero_image" id="add_hero_image">
                            <button type="button" class="btn btn-outline-secondary btn-choose-media" onclick="openMediaPicker('add_hero_image', 'add_hero_preview')">
                                <i class="fas fa-images"></i> Choose
                            </button>
                        </div>
                        <div id="add_hero_preview" class="image-preview-box">
                            <img src="" alt="Preview">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Display Order</label>
                        <input type="number" class="form-control" name="display_order" value="1" min="0">
                    </div>
                    <div class="col-md-3 mb-3 d-flex align-items-end">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="is_tool" id="add_is_tool" checked>
                            <label class="form-check-label" for="add_is_tool">
                                This is a tool page
                            </label>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Create Topic
                </button>
            </form>
        </div>
    </div>

    <?php foreach ($topics as $topic): ?>
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0">
                    <i class="fas fa-book"></i>
                    <?php echo htmlspecialchars($topic['title_en']); ?> / <?php echo htmlspecialchars($topic['title_ar']); ?>
                    <?php if ($topic['is_tool']): ?>
                        <span class="badge bg-info ms-2"><i class="fas fa-toolbox"></i> Tool</span>
                    <?php else: ?>
                        <span class="badge bg-secondary ms-2"><i class="fas fa-layer-group"></i> Topic</span>
                    <?php endif; ?>
                </h6>
                <?php if ($topic['is_tool']): ?>
                    <form method="POST" onsubmit="return confirm('Delete this tool? This will remove all related content items.');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<?php echo $topic['id']; ?>">
                        <button type="submit" class="btn btn-sm btn-outline-danger">
                            <i class="fas fa-trash"></i> Delete Tool
                        </button>
                    </form>
                <?php endif; ?>
            </div>
            <div class="card-body">
                <form method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<?php echo $topic['id']; ?>">

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Slug (URL)</label>
                            <input type="text" class="form-control" name="slug" value="<?php echo htmlspecialchars($topic['slug']); ?>" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Title (English)</label>
                            <input type="text" class="form-control" name="title_en" value="<?php echo htmlspecialchars($topic['title_en']); ?>" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Title (Arabic)</label>
                            <input type="text" class="form-control" name="title_ar" value="<?php echo htmlspecialchars($topic['title_ar']); ?>" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Intro (English)</label>
                            <textarea class="form-control" name="intro_en" rows="3" required><?php echo htmlspecialchars($topic['intro_en']); ?></textarea>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Intro (Arabic)</label>
                            <textarea class="form-control" name="intro_ar" rows="3" required><?php echo htmlspecialchars($topic['intro_ar']); ?></textarea>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Hero Image URL</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="hero_image" id="hero_image_<?php echo $topic['id']; ?>" value="<?php echo htmlspecialchars($topic['hero_image']); ?>">
                                <button type="button" class="btn btn-outline-secondary btn-choose-media" onclick="openMediaPicker('hero_image_<?php echo $topic['id']; ?>', 'hero_preview_<?php echo $topic['id']; ?>')">
                                    <i class="fas fa-images"></i> Choose
                                </button>
                            </div>
                            <div id="hero_preview_<?php echo $topic['id']; ?>" class="image-preview-box <?php echo !empty($topic['hero_image']) ? 'active' : ''; ?>">
                                <img src="<?php echo !empty($topic['hero_image']) ? htmlspecialchars($topic['hero_image']) : ''; ?>" alt="Preview">
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Display Order</label>
                            <input type="number" class="form-control" name="display_order" value="<?php echo (int)$topic['display_order']; ?>" required>
                        </div>
                        <div class="col-md-3 mb-3 d-flex align-items-end">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="is_tool" id="is_tool_<?php echo $topic['id']; ?>" <?php echo $topic['is_tool'] ? 'checked' : ''; ?>>
                                <label class="form-check-label" for="is_tool_<?php echo $topic['id']; ?>">
                                    This is a tool page
                                </label>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update Topic
                    </button>
                </form>
            </div>
        </div>
    <?php endforeach; ?>
</div>

<script>
    const mediaFiles = <?php echo json_encode($media_files); ?>;
</script>

<?php require_once __DIR__ . '/includes/footer.php'; ?>
