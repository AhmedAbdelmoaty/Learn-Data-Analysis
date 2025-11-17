<?php
require_once 'includes/db.php';

echo "Starting data seeding...\n\n";

try {
    // Seed Topics
    $topics = [
        [
            'slug' => 'excel',
            'title_en' => 'Microsoft Excel',
            'title_ar' => 'مايكروسوفت إكسل',
            'intro_en' => 'Master data analysis and visualization with Microsoft Excel. Learn formulas, pivot tables, charts, and advanced data manipulation techniques.',
            'intro_ar' => 'أتقن تحليل البيانات والتصور باستخدام مايكروسوفت إكسل. تعلم الصيغ والجداول المحورية والمخططات وتقنيات معالجة البيانات المتقدمة.',
            'hero_image' => 'https://via.placeholder.com/1200x400/4CAF50/ffffff?text=Excel',
            'hero_overlay_color_start' => '#2E7D32',
            'hero_overlay_color_end' => '#1B5E20',
            'hero_overlay_opacity_start' => 90,
            'hero_overlay_opacity_end' => 90,
            'display_order' => 1,
            'is_tool' => true
        ],
        [
            'slug' => 'power-bi',
            'title_en' => 'Power BI',
            'title_ar' => 'باور بي آي',
            'intro_en' => 'Create interactive dashboards and powerful visualizations with Microsoft Power BI. Transform raw data into actionable insights.',
            'intro_ar' => 'قم بإنشاء لوحات معلومات تفاعلية وتصورات قوية باستخدام مايكروسوفت باور بي آي. حول البيانات الأولية إلى رؤى قابلة للتنفيذ.',
            'hero_image' => 'https://via.placeholder.com/1200x400/FF9800/ffffff?text=Power+BI',
            'hero_overlay_color_start' => '#FFC400',
            'hero_overlay_color_end' => '#CC7800',
            'hero_overlay_opacity_start' => 92,
            'hero_overlay_opacity_end' => 90,
            'display_order' => 2,
            'is_tool' => true
        ],
        [
            'slug' => 'statistics',
            'title_en' => 'Statistics',
            'title_ar' => 'الإحصاء',
            'intro_en' => 'Understand statistical concepts essential for data analysis. Learn hypothesis testing, probability distributions, and statistical inference.',
            'intro_ar' => 'فهم المفاهيم الإحصائية الأساسية لتحليل البيانات. تعلم اختبار الفرضيات وتوزيعات الاحتمالات والاستدلال الإحصائي.',
            'hero_image' => 'https://via.placeholder.com/1200x400/2196F3/ffffff?text=Statistics',
            'hero_overlay_color_start' => '#009688',
            'hero_overlay_color_end' => '#00695C',
            'hero_overlay_opacity_start' => 90,
            'hero_overlay_opacity_end' => 90,
            'display_order' => 3,
            'is_tool' => false
        ],
        [
            'slug' => 'sql',
            'title_en' => 'SQL',
            'title_ar' => 'لغة الاستعلام المهيكلة',
            'intro_en' => 'Query and manage databases with SQL. Learn to extract, filter, and analyze data from relational databases efficiently.',
            'intro_ar' => 'الاستعلام عن قواعد البيانات وإدارتها باستخدام SQL. تعلم استخراج البيانات وتصفيتها وتحليلها من قواعد البيانات العلائقية بكفاءة.',
            'hero_image' => 'https://via.placeholder.com/1200x400/9C27B0/ffffff?text=SQL',
            'hero_overlay_color_start' => '#3F51B5',
            'hero_overlay_color_end' => '#21358C',
            'hero_overlay_opacity_start' => 90,
            'hero_overlay_opacity_end' => 90,
            'display_order' => 4,
            'is_tool' => true
        ],
        [
            'slug' => 'tableau',
            'title_en' => 'Tableau',
            'title_ar' => 'تابلو',
            'intro_en' => 'Transform complex datasets into engaging visuals with Tableau dashboards and stories.',
            'intro_ar' => 'حوّل مجموعات البيانات المعقدة إلى تصورات جذابة من خلال لوحات تابلو وقصص البيانات.',
            'hero_image' => 'https://via.placeholder.com/1200x400/FF6F00/ffffff?text=Tableau',
            'hero_overlay_color_start' => '#E97627',
            'hero_overlay_color_end' => '#00567A',
            'hero_overlay_opacity_start' => 92,
            'hero_overlay_opacity_end' => 90,
            'display_order' => 5,
            'is_tool' => true
        ],
        [
            'slug' => 'looker-studio',
            'title_en' => 'Looker Studio',
            'title_ar' => 'لوكر ستوديو',
            'intro_en' => 'Build lightweight, shareable dashboards powered by Google marketing and analytics data.',
            'intro_ar' => 'أنشئ لوحات معلومات خفيفة الوزن وسهلة المشاركة تعتمد على بيانات التسويق والتحليلات من Google.',
            'hero_image' => 'https://via.placeholder.com/1200x400/1A73E8/ffffff?text=Looker+Studio',
            'hero_overlay_color_start' => '#1A73E8',
            'hero_overlay_color_end' => '#0D47A1',
            'hero_overlay_opacity_start' => 92,
            'hero_overlay_opacity_end' => 90,
            'display_order' => 6,
            'is_tool' => true
        ],
        [
            'slug' => 'ibm-cognos',
            'title_en' => 'IBM Cognos Analytics',
            'title_ar' => 'آي بي إم كوجنوس أناليتكس',
            'intro_en' => 'Deliver governed BI, AI-assisted insights, and enterprise reporting with IBM Cognos.',
            'intro_ar' => 'قدّم ذكاءً أعمالياً مضبوطاً ورؤى مدعومة بالذكاء الاصطناعي وتقارير مؤسسية باستخدام IBM Cognos.',
            'hero_image' => 'https://via.placeholder.com/1200x400/0F62FE/ffffff?text=IBM+Cognos',
            'hero_overlay_color_start' => '#0F62FE',
            'hero_overlay_color_end' => '#0043CE',
            'hero_overlay_opacity_start' => 92,
            'hero_overlay_opacity_end' => 90,
            'display_order' => 7,
            'is_tool' => true
        ]
    ];

    foreach ($topics as $topic) {
        $stmt = $pdo->prepare("INSERT INTO topics (slug, title_en, title_ar, intro_en, intro_ar, hero_image, hero_overlay_color_start, hero_overlay_color_end, hero_overlay_opacity_start, hero_overlay_opacity_end, display_order, is_tool)
                               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                               ON CONFLICT (slug) DO UPDATE SET
                               title_en = EXCLUDED.title_en,
                               title_ar = EXCLUDED.title_ar,
                               intro_en = EXCLUDED.intro_en,
                               intro_ar = EXCLUDED.intro_ar,
                               hero_image = EXCLUDED.hero_image,
                               hero_overlay_color_start = EXCLUDED.hero_overlay_color_start,
                               hero_overlay_color_end = EXCLUDED.hero_overlay_color_end,
                               hero_overlay_opacity_start = EXCLUDED.hero_overlay_opacity_start,
                               hero_overlay_opacity_end = EXCLUDED.hero_overlay_opacity_end,
                               display_order = EXCLUDED.display_order,
                               is_tool = EXCLUDED.is_tool");
        $stmt->execute([
            $topic['slug'],
            $topic['title_en'],
            $topic['title_ar'],
            $topic['intro_en'],
            $topic['intro_ar'],
            $topic['hero_image'],
            $topic['hero_overlay_color_start'],
            $topic['hero_overlay_color_end'],
            $topic['hero_overlay_opacity_start'],
            $topic['hero_overlay_opacity_end'],
            $topic['display_order'],
            $topic['is_tool']
        ]);
    }
    echo "✓ Topics seeded (4 topics)\n";

    // Get topic IDs for content items
    $topics_data = $pdo->query("SELECT id, slug FROM topics")->fetchAll();
    $topic_ids = [];
    foreach ($topics_data as $t) {
        $topic_ids[$t['slug']] = $t['id'];
    }

    // Seed Content Items (2 per topic)
    $content_items = [
        // Excel
        [
            'topic_id' => $topic_ids['excel'],
            'slug' => 'formulas-functions',
            'title_en' => 'Essential Formulas and Functions',
            'title_ar' => 'الصيغ والدوال الأساسية',
            'summary_en' => 'Learn the most commonly used Excel formulas and functions for data analysis.',
            'summary_ar' => 'تعلم صيغ ودوال Excel الأكثر استخدامًا لتحليل البيانات.',
            'body_en' => '<h2>Introduction to Excel Formulas</h2><p>Excel formulas are essential tools for data analysis. In this guide, you will learn about VLOOKUP, SUMIF, COUNTIF, and other powerful functions that will help you analyze data efficiently.</p><p>Understanding these formulas will significantly improve your productivity and data analysis capabilities.</p>',
            'body_ar' => '<h2>مقدمة إلى صيغ Excel</h2><p>صيغ Excel هي أدوات أساسية لتحليل البيانات. في هذا الدليل ، ستتعلم عن VLOOKUP و SUMIF و COUNTIF والوظائف القوية الأخرى التي ستساعدك على تحليل البيانات بكفاءة.</p><p>فهم هذه الصيغ سيحسن بشكل كبير إنتاجيتك وقدراتك في تحليل البيانات.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/4CAF50/ffffff?text=Excel+Formulas',
            'status' => 'published',
            'display_order' => 1
        ],
        [
            'topic_id' => $topic_ids['excel'],
            'slug' => 'pivot-tables',
            'title_en' => 'Mastering Pivot Tables',
            'title_ar' => 'إتقان الجداول المحورية',
            'summary_en' => 'Discover how to create powerful pivot tables to summarize and analyze large datasets.',
            'summary_ar' => 'اكتشف كيفية إنشاء جداول محورية قوية لتلخيص وتحليل مجموعات البيانات الكبيرة.',
            'body_en' => '<h2>What are Pivot Tables?</h2><p>Pivot tables are one of the most powerful features in Excel for data analysis. They allow you to quickly summarize large amounts of data and gain insights.</p><p>Learn how to create, customize, and use pivot tables to transform your raw data into meaningful reports.</p>',
            'body_ar' => '<h2>ما هي الجداول المحورية؟</h2><p>الجداول المحورية هي واحدة من أقوى الميزات في Excel لتحليل البيانات. إنها تتيح لك تلخيص كميات كبيرة من البيانات بسرعة والحصول على رؤى.</p><p>تعلم كيفية إنشاء الجداول المحورية وتخصيصها واستخدامها لتحويل بياناتك الأولية إلى تقارير ذات مغزى.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/4CAF50/ffffff?text=Pivot+Tables',
            'status' => 'published',
            'display_order' => 2
        ],
        // Power BI
        [
            'topic_id' => $topic_ids['power-bi'],
            'slug' => 'getting-started',
            'title_en' => 'Getting Started with Power BI',
            'title_ar' => 'البدء مع باور بي آي',
            'summary_en' => 'Your first steps into the world of business intelligence with Power BI.',
            'summary_ar' => 'خطواتك الأولى في عالم ذكاء الأعمال باستخدام باور بي آي.',
            'body_en' => '<h2>Introduction to Power BI</h2><p>Power BI is a business analytics service by Microsoft that enables you to visualize your data and share insights across your organization.</p><p>This guide will help you understand the basics of Power BI Desktop, connect to data sources, and create your first visualization.</p>',
            'body_ar' => '<h2>مقدمة إلى باور بي آي</h2><p>باور بي آي هي خدمة تحليلات الأعمال من مايكروسوفت التي تمكنك من تصور بياناتك ومشاركة الرؤى عبر مؤسستك.</p><p>سيساعدك هذا الدليل على فهم أساسيات Power BI Desktop والاتصال بمصادر البيانات وإنشاء التصور الأول.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/FF9800/ffffff?text=Power+BI+Basics',
            'status' => 'published',
            'display_order' => 1
        ],
        [
            'topic_id' => $topic_ids['power-bi'],
            'slug' => 'dax-basics',
            'title_en' => 'DAX Formulas Basics',
            'title_ar' => 'أساسيات صيغ DAX',
            'summary_en' => 'Learn Data Analysis Expressions (DAX) to create powerful calculations in Power BI.',
            'summary_ar' => 'تعلم تعبيرات تحليل البيانات (DAX) لإنشاء حسابات قوية في باور بي آي.',
            'body_en' => '<h2>Understanding DAX</h2><p>DAX (Data Analysis Expressions) is a formula language used in Power BI to create custom calculations and aggregations.</p><p>Master DAX to unlock the full potential of Power BI and create sophisticated data models and reports.</p>',
            'body_ar' => '<h2>فهم DAX</h2><p>DAX (تعبيرات تحليل البيانات) هي لغة صيغة تُستخدم في Power BI لإنشاء حسابات وتجميعات مخصصة.</p><p>إتقان DAX لإطلاق الإمكانات الكاملة لـ Power BI وإنشاء نماذج بيانات وتقارير متطورة.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/FF9800/ffffff?text=DAX+Formulas',
            'status' => 'published',
            'display_order' => 2
        ],
        // Statistics
        [
            'topic_id' => $topic_ids['statistics'],
            'slug' => 'descriptive-statistics',
            'title_en' => 'Descriptive Statistics',
            'title_ar' => 'الإحصاء الوصفي',
            'summary_en' => 'Learn to summarize and describe the main features of a dataset.',
            'summary_ar' => 'تعلم كيفية تلخيص ووصف الميزات الرئيسية لمجموعة البيانات.',
            'body_en' => '<h2>What is Descriptive Statistics?</h2><p>Descriptive statistics provide simple summaries about the sample and the measures. Learn about mean, median, mode, standard deviation, and other key metrics.</p><p>These fundamental concepts are essential for any data analyst.</p>',
            'body_ar' => '<h2>ما هو الإحصاء الوصفي؟</h2><p>توفر الإحصائيات الوصفية ملخصات بسيطة عن العينة والمقاييس. تعرف على المتوسط والوسيط والمنوال والانحراف المعياري والمقاييس الرئيسية الأخرى.</p><p>هذه المفاهيم الأساسية ضرورية لأي محلل بيانات.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/2196F3/ffffff?text=Descriptive+Stats',
            'status' => 'published',
            'display_order' => 1
        ],
        [
            'topic_id' => $topic_ids['statistics'],
            'slug' => 'hypothesis-testing',
            'title_en' => 'Hypothesis Testing',
            'title_ar' => 'اختبار الفرضيات',
            'summary_en' => 'Understanding how to test hypotheses and make data-driven decisions.',
            'summary_ar' => 'فهم كيفية اختبار الفرضيات واتخاذ قرارات مستندة إلى البيانات.',
            'body_en' => '<h2>Introduction to Hypothesis Testing</h2><p>Hypothesis testing is a statistical method used to make decisions using data. Learn about null and alternative hypotheses, p-values, and significance levels.</p><p>This knowledge is crucial for making informed business decisions based on data analysis.</p>',
            'body_ar' => '<h2>مقدمة لاختبار الفرضيات</h2><p>اختبار الفرضيات هو طريقة إحصائية تستخدم لاتخاذ القرارات باستخدام البيانات. تعرف على الفرضيات الصفرية والبديلة وقيم p ومستويات الأهمية.</p><p>هذه المعرفة حاسمة لاتخاذ قرارات تجارية مستنيرة بناءً على تحليل البيانات.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/2196F3/ffffff?text=Hypothesis+Testing',
            'status' => 'published',
            'display_order' => 2
        ],
        // SQL
        [
            'topic_id' => $topic_ids['sql'],
            'slug' => 'basic-queries',
            'title_en' => 'SQL Basic Queries',
            'title_ar' => 'استعلامات SQL الأساسية',
            'summary_en' => 'Learn the fundamental SQL commands: SELECT, WHERE, ORDER BY, and more.',
            'summary_ar' => 'تعلم أوامر SQL الأساسية: SELECT و WHERE و ORDER BY والمزيد.',
            'body_en' => '<h2>Getting Started with SQL</h2><p>SQL (Structured Query Language) is essential for working with databases. Learn how to write basic queries to select, filter, and sort data.</p><p>Master these fundamentals to start querying databases effectively.</p>',
            'body_ar' => '<h2>البدء مع SQL</h2><p>SQL (لغة الاستعلام الهيكلية) ضرورية للعمل مع قواعد البيانات. تعلم كيفية كتابة استعلامات أساسية لتحديد البيانات وتصفيتها وفرزها.</p><p>أتقن هذه الأساسيات لبدء الاستعلام عن قواعد البيانات بشكل فعال.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/9C27B0/ffffff?text=SQL+Basics',
            'status' => 'published',
            'display_order' => 1
        ],
        [
            'topic_id' => $topic_ids['sql'],
            'slug' => 'joins-relationships',
            'title_en' => 'SQL Joins and Relationships',
            'title_ar' => 'الانضمامات والعلاقات في SQL',
            'summary_en' => 'Master INNER JOIN, LEFT JOIN, and other types of joins to combine data from multiple tables.',
            'summary_ar' => 'أتقن INNER JOIN و LEFT JOIN وأنواع أخرى من الانضمامات لدمج البيانات من جداول متعددة.',
            'body_en' => '<h2>Understanding SQL Joins</h2><p>Joins are used to combine rows from two or more tables based on a related column. Learn about different types of joins and when to use each one.</p><p>This is a critical skill for working with relational databases and performing complex data analysis.</p>',
            'body_ar' => '<h2>فهم انضمامات SQL</h2><p>تُستخدم الانضمامات لدمج الصفوف من جدولين أو أكثر بناءً على عمود ذي صلة. تعرف على أنواع مختلفة من الانضمامات ومتى تستخدم كل منها.</p><p>هذه مهارة حاسمة للعمل مع قواعد البيانات العلائقية وإجراء تحليل بيانات معقد.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/9C27B0/ffffff?text=SQL+Joins',
            'status' => 'published',
            'display_order' => 2
        ],
        // Tableau
        [
            'topic_id' => $topic_ids['tableau'],
            'slug' => 'visual-analytics',
            'title_en' => 'Tableau Visual Analytics Foundations',
            'title_ar' => 'أساسيات التحليلات المرئية في تابلو',
            'summary_en' => 'Learn how to design worksheets, dashboards, and stories that communicate insights instantly.',
            'summary_ar' => 'تعلم كيفية تصميم أوراق العمل واللوحات والقصص التي تنقل الرؤى فورًا.',
            'body_en' => '<h2>Design Immersive Dashboards</h2><p>Discover best practices for choosing chart types, applying the Marks card, and building responsive layouts that keep executives focused on the KPIs that matter.</p><p>You will also learn how to publish dashboards to Tableau Cloud and share governed data sources with your stakeholders.</p>',
            'body_ar' => '<h2>صمّم لوحات تفاعلية مبهرة</h2><p>اكتشف أفضل الممارسات لاختيار أنواع الرسوم وتطبيق بطاقة Marks وبناء تخطيطات متجاوبة تُبقي المديرين التنفيذيين مركّزين على مؤشرات الأداء المهمة.</p><p>ستتعلم أيضًا كيفية نشر اللوحات على Tableau Cloud ومشاركة مصادر البيانات المضبوطة مع أصحاب المصلحة.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/FF6F00/ffffff?text=Tableau+Dashboards',
            'status' => 'published',
            'display_order' => 1
        ],
        [
            'topic_id' => $topic_ids['tableau'],
            'slug' => 'data-prep',
            'title_en' => 'Preparing Data with Tableau Prep Builder',
            'title_ar' => 'تحضير البيانات باستخدام Tableau Prep',
            'summary_en' => 'Clean, join, and reshape messy data sources before they reach your dashboards.',
            'summary_ar' => 'قم بتنظيف وربط وإعادة تشكيل مصادر البيانات غير المرتبة قبل أن تصل إلى لوحاتك.',
            'body_en' => '<h2>Reliable Data Pipelines</h2><p>Use flows, steps, and smart sampling in Tableau Prep to automate repeatable cleaning tasks, generate calculations, and document data lineage.</p><p>The lesson includes tips for publishing flows to Tableau Server so refresh schedules remain under centralized control.</p>',
            'body_ar' => '<h2>خطوط بيانات موثوقة</h2><p>استخدم التدفقات والخطوات وأخذ العينات الذكي في Tableau Prep لأتمتة مهام التنظيف المتكررة، وإنشاء الحسابات، وتوثيق نسب البيانات.</p><p>يتضمن الشرح نصائح لنشر التدفقات على Tableau Server لضمان بقاء جداول التحديث تحت السيطرة المركزية.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/00567A/ffffff?text=Tableau+Prep',
            'status' => 'published',
            'display_order' => 2
        ],
        // Looker Studio
        [
            'topic_id' => $topic_ids['looker-studio'],
            'slug' => 'marketing-performance',
            'title_en' => 'Looker Studio Marketing Performance Dashboard',
            'title_ar' => 'لوحة أداء التسويق في لوكر ستوديو',
            'summary_en' => 'Blend Google Ads, Analytics, and social data into a single shareable report.',
            'summary_ar' => 'ادمج بيانات Google Ads و Analytics ووسائل التواصل في تقرير واحد قابل للمشاركة.',
            'body_en' => '<h2>Tell the Full Funnel Story</h2><p>Connect native Google connectors, create calculated fields, and apply community visualizations to highlight campaign ROI.</p><p>We also cover best practices for scheduled email delivery and parameter controls so stakeholders can filter KPIs by region or audience.</p>',
            'body_ar' => '<h2>احكِ قصة القمع التسويقي بالكامل</h2><p>قم بتوصيل موصلات Google الأصلية، وأنشئ حقولاً محسوبة، وطبق التصورات المجتمعية لإبراز العائد على الاستثمار للحملات.</p><p>نستعرض أيضًا أفضل الممارسات لإرسال التقارير عبر البريد الإلكتروني مجدولاً واستخدام أدوات المعلمات حتى يتمكن أصحاب المصلحة من تصفية مؤشرات الأداء حسب المنطقة أو الجمهور.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/1A73E8/ffffff?text=Looker+Studio+Marketing',
            'status' => 'published',
            'display_order' => 1
        ],
        [
            'topic_id' => $topic_ids['looker-studio'],
            'slug' => 'data-blending',
            'title_en' => 'Advanced Data Blending Techniques',
            'title_ar' => 'تقنيات الدمج المتقدم للبيانات',
            'summary_en' => 'Unlock multi-source insights with blended charts, CASE expressions, and filters.',
            'summary_ar' => 'افتح رؤى متعددة المصادر باستخدام المخططات المدمجة وتعبيرات CASE والفلاتر.',
            'body_en' => '<h2>Confidently Combine Sources</h2><p>Learn how join keys, relationship configurations, and data freshness settings impact blended results in Looker Studio.</p><p>We share troubleshooting tips for mismatched date ranges and how to optimize reports for executive-ready PDF exports.</p>',
            'body_ar' => '<h2>ادمج المصادر بثقة</h2><p>تعلم كيف تؤثر مفاتيح الربط وإعدادات العلاقات وتحديث البيانات على نتائج الدمج في لوكر ستوديو.</p><p>نقدم نصائح لحل المشكلات المتعلقة بعدم تطابق النطاقات الزمنية وكيفية تحسين التقارير لتصدير ملفات PDF جاهزة للمديرين.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/0D47A1/ffffff?text=Looker+Studio+Blending',
            'status' => 'published',
            'display_order' => 2
        ],
        // IBM Cognos
        [
            'topic_id' => $topic_ids['ibm-cognos'],
            'slug' => 'report-authoring',
            'title_en' => 'Authoring Pixel-Perfect Reports',
            'title_ar' => 'إنشاء تقارير دقيقة في كوجنوس',
            'summary_en' => 'Use Cognos Report Authoring to build governed statements, burst schedules, and multilingual layouts.',
            'summary_ar' => 'استخدم أداة إنشاء التقارير في كوجنوس لبناء تقارير مضبوطة وجدولة الإرسال وإنشاء تخطيطات بلغات متعددة.',
            'body_en' => '<h2>Enterprise Reporting Discipline</h2><p>Walk through queries, data items, and reusable templates that ensure finance, compliance, and operations consume the same trusted KPIs.</p><p>We demonstrate bursting, prompt pages, and subscriptions so distribution stays automated and auditable.</p>',
            'body_ar' => '<h2>انضباط التقارير المؤسسية</h2><p>استعرض الاستعلامات وعناصر البيانات والقوالب القابلة لإعادة الاستخدام التي تضمن اعتماد المالية والامتثال والعمليات على نفس مؤشرات الأداء الموثوقة.</p><p>نوضح خاصية الإرسال المجدول وصفحات المطالبات والاشتراكات بحيث يظل التوزيع آليًا وقابلاً للتدقيق.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/0F62FE/ffffff?text=IBM+Cognos+Reports',
            'status' => 'published',
            'display_order' => 1
        ],
        [
            'topic_id' => $topic_ids['ibm-cognos'],
            'slug' => 'data-modules',
            'title_en' => 'Modeling Data Modules with AI Assistance',
            'title_ar' => 'نمذجة وحدات البيانات بمساعدة الذكاء الاصطناعي',
            'summary_en' => 'Shape curated datasets, relationships, and intent-based suggestions inside Cognos.',
            'summary_ar' => 'شكّل مجموعات بيانات منسقة وعلاقات واقتراحات قائمة على النوايا داخل كوجنوس.',
            'body_en' => '<h2>Trustworthy Semantic Layers</h2><p>Use intent-driven modeling, relative time filters, and data sets to standardize KPIs for your analytics community.</p><p>You will build calculations, custom groups, and navigation paths that make Cognos Dashboards more intuitive for self-service users.</p>',
            'body_ar' => '<h2>طبقات دلالية موثوقة</h2><p>استخدم النمذجة الموجّهة بالنوايا وفلاتر الوقت النسبي ومجموعات البيانات لتوحيد مؤشرات الأداء لمجتمع التحليلات لديك.</p><p>ستبني حسابات ومجموعات مخصصة ومسارات تنقل تجعل لوحات كوجنوس أكثر سهولة للمستخدمين المعتمدين على الخدمة الذاتية.</p>',
            'cta_note_en' => 'Want to go deeper? Continue your journey inside our full Training Program.',
            'cta_note_ar' => 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.',
            'hero_image' => 'https://via.placeholder.com/800x400/0043CE/ffffff?text=IBM+Cognos+Modeling',
            'status' => 'published',
            'display_order' => 2
        ]
    ];

    foreach ($content_items as $item) {
        $stmt = $pdo->prepare("INSERT INTO content_items (topic_id, slug, title_en, title_ar, summary_en, summary_ar, body_en, body_ar, cta_note_en, cta_note_ar, hero_image, status, display_order)
                               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                               ON CONFLICT (topic_id, slug) DO UPDATE SET
                               title_en = EXCLUDED.title_en,
                               title_ar = EXCLUDED.title_ar,
                               summary_en = EXCLUDED.summary_en,
                               summary_ar = EXCLUDED.summary_ar,
                               body_en = EXCLUDED.body_en,
                               body_ar = EXCLUDED.body_ar,
                               cta_note_en = EXCLUDED.cta_note_en,
                               cta_note_ar = EXCLUDED.cta_note_ar,
                               hero_image = EXCLUDED.hero_image,
                               status = EXCLUDED.status,
                               display_order = EXCLUDED.display_order");
        $stmt->execute([
            $item['topic_id'],
            $item['slug'],
            $item['title_en'],
            $item['title_ar'],
            $item['summary_en'],
            $item['summary_ar'],
            $item['body_en'],
            $item['body_ar'],
            $item['cta_note_en'],
            $item['cta_note_ar'],
            $item['hero_image'],
            $item['status'],
            $item['display_order']
        ]);
    }
    echo "✓ Content items seeded (8 explainers - 2 per topic)\n";

    // Seed About page sections
    $about_sections = [
        [
            'page_name' => 'about',
            'section_key' => 'intro',
            'title_en' => 'About Our Data Analysis Program',
            'title_ar' => 'حول برنامج تحليل البيانات الخاص بنا',
            'body_en' => 'We are dedicated to empowering professionals with cutting-edge data analysis skills. Our comprehensive program covers everything from Excel basics to advanced statistical analysis and business intelligence tools.',
            'body_ar' => 'نحن ملتزمون بتمكين المهنيين من خلال مهارات تحليل البيانات المتطورة. يغطي برنامجنا الشامل كل شيء من أساسيات Excel إلى التحليل الإحصائي المتقدم وأدوات ذكاء الأعمال.',
            'image' => 'https://via.placeholder.com/600x400/673AB7/ffffff?text=About+Us',
            'is_enabled' => true,
            'display_order' => 1
        ],
        [
            'page_name' => 'about',
            'section_key' => 'mission',
            'title_en' => 'Our Mission',
            'title_ar' => 'مهمتنا',
            'subtitle_en' => 'Transforming Data into Insights',
            'subtitle_ar' => 'تحويل البيانات إلى رؤى',
            'body_en' => 'Our mission is to make data analysis accessible to everyone. We believe that data-driven decision making is the key to success in today\'s business environment. Through our expert-led courses, we help students master the tools and techniques needed to excel in data analysis.',
            'body_ar' => 'مهمتنا هي جعل تحليل البيانات في متناول الجميع. نعتقد أن اتخاذ القرار القائم على البيانات هو مفتاح النجاح في بيئة الأعمال اليوم. من خلال دوراتنا التي يقودها الخبراء ، نساعد الطلاب على إتقان الأدوات والتقنيات اللازمة للتفوق في تحليل البيانات.',
            'image' => 'https://via.placeholder.com/600x400/009688/ffffff?text=Mission',
            'is_enabled' => true,
            'display_order' => 2
        ],
        [
            'page_name' => 'about',
            'section_key' => 'approach',
            'title_en' => 'Our Approach',
            'title_ar' => 'نهجنا',
            'subtitle_en' => 'Practical, Hands-on Learning',
            'subtitle_ar' => 'التعلم العملي التطبيقي',
            'body_en' => 'We focus on practical, real-world applications. Our curriculum is designed around actual business scenarios, ensuring that you can immediately apply what you learn. Each course includes hands-on exercises, real datasets, and practical projects.',
            'body_ar' => 'نركز على التطبيقات العملية في العالم الحقيقي. تم تصميم منهجنا الدراسي حول سيناريوهات الأعمال الفعلية ، مما يضمن أنه يمكنك تطبيق ما تتعلمه على الفور. تتضمن كل دورة تمارين عملية ومجموعات بيانات حقيقية ومشاريع عملية.',
            'image' => 'https://via.placeholder.com/600x400/FF5722/ffffff?text=Approach',
            'is_enabled' => true,
            'display_order' => 3
        ]
    ];

    foreach ($about_sections as $section) {
        $stmt = $pdo->prepare("INSERT INTO page_sections (page_name, section_key, title_en, title_ar, subtitle_en, subtitle_ar, body_en, body_ar, image, is_enabled, display_order) 
                               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                               ON CONFLICT (page_name, section_key) DO UPDATE SET 
                               title_en = EXCLUDED.title_en,
                               title_ar = EXCLUDED.title_ar,
                               subtitle_en = EXCLUDED.subtitle_en,
                               subtitle_ar = EXCLUDED.subtitle_ar,
                               body_en = EXCLUDED.body_en,
                               body_ar = EXCLUDED.body_ar,
                               image = EXCLUDED.image,
                               is_enabled = EXCLUDED.is_enabled,
                               display_order = EXCLUDED.display_order");
        $stmt->execute([
            $section['page_name'],
            $section['section_key'],
            $section['title_en'],
            $section['title_ar'],
            $section['subtitle_en'] ?? null,
            $section['subtitle_ar'] ?? null,
            $section['body_en'],
            $section['body_ar'],
            $section['image'],
            $section['is_enabled'],
            $section['display_order']
        ]);
    }
    echo "✓ About page sections seeded (3 sections)\n";

    // Seed Home page sections
    $home_sections = [
        [
            'page_name' => 'home',
            'section_key' => 'why_data',
            'title_en' => 'Why Data Analysis?',
            'title_ar' => 'لماذا تحليل البيانات؟',
            'body_en' => 'In today\'s data-driven world, the ability to analyze and interpret data is more valuable than ever. Data analysis skills open doors to countless career opportunities and enable you to make smarter, evidence-based decisions.',
            'body_ar' => 'في عالم اليوم القائم على البيانات ، تعد القدرة على تحليل البيانات وتفسيرها أكثر قيمة من أي وقت مضى. تفتح مهارات تحليل البيانات الأبواب أمام فرص وظيفية لا حصر لها وتمكنك من اتخاذ قرارات أكثر ذكاءً تستند إلى الأدلة.',
            'is_enabled' => true,
            'display_order' => 1
        ]
    ];

    foreach ($home_sections as $section) {
        $stmt = $pdo->prepare("INSERT INTO page_sections (page_name, section_key, title_en, title_ar, body_en, body_ar, is_enabled, display_order) 
                               VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                               ON CONFLICT (page_name, section_key) DO UPDATE SET 
                               title_en = EXCLUDED.title_en,
                               title_ar = EXCLUDED.title_ar,
                               body_en = EXCLUDED.body_en,
                               body_ar = EXCLUDED.body_ar,
                               is_enabled = EXCLUDED.is_enabled,
                               display_order = EXCLUDED.display_order");
        $stmt->execute([
            $section['page_name'],
            $section['section_key'],
            $section['title_en'],
            $section['title_ar'],
            $section['body_en'],
            $section['body_ar'],
            $section['is_enabled'],
            $section['display_order']
        ]);
    }
    echo "✓ Home page sections seeded (1 section)\n";

    // Seed Tools page sections
    $tools_sections = [
        [
            'page_name' => 'tools',
            'section_key' => 'hero',
            'title_en' => 'Discover the Tools You Need',
            'title_ar' => 'اكتشف الأدوات التي تحتاجها',
            'subtitle_en' => 'Browse the tools we teach and dive into in-depth guides, tutorials, and resources for each platform.',
            'subtitle_ar' => 'تصفح الأدوات التي نقدمها واطلع على الأدلة والشروحات والموارد المتعمقة لكل منصة.',
            'image' => 'https://via.placeholder.com/1600x600/A8324E/ffffff?text=Tools+Hero',
            'is_enabled' => true,
            'display_order' => 1
        ],
        [
            'page_name' => 'tools',
            'section_key' => 'intro',
            'title_en' => 'Choose Your Learning Path',
            'title_ar' => 'اختر مسار التعلم المناسب لك',
            'body_en' => 'Each tool page includes structured lessons, practical tutorials, and curated content designed to help you master the platform from beginner to advanced levels.',
            'body_ar' => 'تتضمن كل صفحة أداة دروسًا منظمة وشروحات عملية ومحتوى مختارًا بعناية لمساعدتك على إتقان المنصة من المستوى المبتدئ إلى المتقدم.',
            'is_enabled' => true,
            'display_order' => 2
        ],
    ];

    foreach ($tools_sections as $section) {
        $stmt = $pdo->prepare("INSERT INTO page_sections (page_name, section_key, title_en, title_ar, subtitle_en, subtitle_ar, body_en, body_ar, image, is_enabled, display_order)
                               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                               ON CONFLICT (page_name, section_key) DO UPDATE SET
                               title_en = EXCLUDED.title_en,
                               title_ar = EXCLUDED.title_ar,
                               subtitle_en = EXCLUDED.subtitle_en,
                               subtitle_ar = EXCLUDED.subtitle_ar,
                               body_en = EXCLUDED.body_en,
                               body_ar = EXCLUDED.body_ar,
                               image = EXCLUDED.image,
                               is_enabled = EXCLUDED.is_enabled,
                               display_order = EXCLUDED.display_order");
        $stmt->execute([
            $section['page_name'],
            $section['section_key'],
            $section['title_en'],
            $section['title_ar'],
            $section['subtitle_en'] ?? null,
            $section['subtitle_ar'] ?? null,
            $section['body_en'] ?? null,
            $section['body_ar'] ?? null,
            $section['image'] ?? null,
            $section['is_enabled'],
            $section['display_order']
        ]);
    }
    echo "✓ Tools page sections seeded (2 sections)\n";

    // Seed Footer settings
    $footer_settings = [
        ['setting_key' => 'footer_about_en', 'setting_value' => 'Learn Data Analysis - Your gateway to mastering Excel, Power BI, Statistics, and SQL.'],
        ['setting_key' => 'footer_about_ar', 'setting_value' => 'تعلم تحليل البيانات - بوابتك لإتقان Excel و Power BI والإحصاء و SQL.'],
        ['setting_key' => 'contact_title_en', 'setting_value' => 'Get In Touch'],
        ['setting_key' => 'contact_title_ar', 'setting_value' => 'تواصل معنا'],
        ['setting_key' => 'contact_intro_en', 'setting_value' => 'We are always ready to help you and answer your questions.'],
        ['setting_key' => 'contact_intro_ar', 'setting_value' => 'نحن دائمًا جاهزون لمساعدتك والإجابة على أسئلتك.'],
        ['setting_key' => 'uae_address_en', 'setting_value' => 'Business Center, Sharjah Publishing City Free Zone, Sharjah, U.A.E.'],
        ['setting_key' => 'uae_address_ar', 'setting_value' => 'مركز الأعمال، مدينة الشارقة للنشر، المنطقة الحرة، الشارقة، الإمارات العربية المتحدة'],
        ['setting_key' => 'uae_phone', 'setting_value' => '+971 50 418 0021'],
        ['setting_key' => 'egypt_address_en', 'setting_value' => '37 Amman St, Fourth Floor, El Dokki, Giza, Egypt'],
        ['setting_key' => 'egypt_address_ar', 'setting_value' => '٣٧ شارع عمان، الدور الرابع، الدقي، الجيزة، مصر'],
        ['setting_key' => 'egypt_phone', 'setting_value' => '+20 10 32244125'],
        ['setting_key' => 'contact_email', 'setting_value' => 'info@learndata.com'],
        ['setting_key' => 'social_facebook_url', 'setting_value' => 'https://facebook.com/learn-data'],
        ['setting_key' => 'social_linkedin_url', 'setting_value' => 'https://linkedin.com/company/learn-data'],
        ['setting_key' => 'social_instagram_url', 'setting_value' => 'https://instagram.com/learn-data'],
        ['setting_key' => 'social_x_url', 'setting_value' => 'https://twitter.com/learn-data']
    ];

    foreach ($footer_settings as $setting) {
        $stmt = $pdo->prepare("INSERT INTO footer_settings (setting_key, setting_value) 
                               VALUES (?, ?) 
                               ON CONFLICT (setting_key) DO UPDATE SET 
                               setting_value = EXCLUDED.setting_value");
        $stmt->execute([$setting['setting_key'], $setting['setting_value']]);
    }
    echo "✓ Footer settings seeded\n";

    echo "\n✅ All data seeded successfully!\n";

} catch (PDOException $e) {
    echo "❌ Error seeding data: " . $e->getMessage() . "\n";
    exit(1);
}
?>
