<?php
if (!function_exists('renderBulkSaveToolbar')) {
    function renderBulkSaveToolbar(array $config = []): void
    {
        $pageTitle = $GLOBALS['page_title'] ?? 'Page Management';
        $defaults = [
            'enabled' => true,
            'icon' => 'fas fa-layer-group',
            'title' => $pageTitle,
            'description' => 'Edit every block on this screen first, then store everything together without waiting for reloads.',
            'tip' => 'Use the Save All Changes button after you finish tweaking each section.',
            'button_label' => 'Save All Changes',
            'button_icon' => 'fas fa-save',
        ];

        $config = array_merge($defaults, $config);

        if (!$config['enabled']) {
            return;
        }
        ?>
        <div class="bulk-save-toolbar-wrapper mb-4" data-bulk-save-wrapper>
            <div class="bulk-save-toolbar d-flex flex-column flex-lg-row align-items-lg-center gap-3 justify-content-between">
                <div>
                    <h2 class="mb-2">
                        <i class="<?php echo htmlspecialchars($config['icon']); ?>"></i>
                        <?php echo htmlspecialchars($config['title']); ?>
                    </h2>
                    <?php if (!empty($config['description'])): ?>
                        <p class="text-muted mb-1"><?php echo htmlspecialchars($config['description']); ?></p>
                    <?php endif; ?>
                    <?php if (!empty($config['tip'])): ?>
                        <p class="text-muted small mb-0">
                            <i class="fas fa-lightbulb me-1"></i>
                            <?php echo htmlspecialchars($config['tip']); ?>
                        </p>
                    <?php endif; ?>
                </div>
                <div class="text-lg-end">
                    <button type="button" class="btn btn-primary btn-lg" data-bulk-save-trigger>
                        <i class="<?php echo htmlspecialchars($config['button_icon']); ?> me-2"></i>
                        <?php echo htmlspecialchars($config['button_label']); ?>
                    </button>
                </div>
            </div>
            <div class="alert d-none mt-3" role="alert" aria-live="polite" data-bulk-save-status></div>
        </div>
        <?php
    }
}
