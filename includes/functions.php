<?php
// Translation function
function t($key, $lang, $settings = []) {
    $translations = [
        'en' => [
            'home' => 'Home',
            'about' => 'About Us',
            'training_program' => 'Training Program',
            'tools' => 'Tools',
            'excel' => 'Excel',
            'power_bi' => 'Power BI',
            'statistics' => 'Statistics',
            'sql' => 'SQL',
            'contact' => 'Contact',
            'contact_us' => 'Contact Us',
            'send_message' => 'Send Message',
            'name' => 'Name',
            'email' => 'Email',
            'phone' => 'Phone',
            'message' => 'Message',
            'submit' => 'Submit',
            'enroll_now' => 'Enroll Now',
            'read_more' => 'Read More',
            'explore_topics' => 'Explore Our Topics',
            'explore_tools' => 'Explore Our Tools',
            'why_data_analysis' => 'Why Data Analysis?',
            'benefits' => 'Key Benefits',
            'testimonials' => 'What Our Students Say',
            'faq' => 'FAQ',
            'site_links' => 'Site Links',
            'follow_us' => 'Follow Us',
            'copyright' => '© ' . date('Y') . ' ' . ($settings['site_name_en'] ?? 'Learn Data Analysis') . '. All rights reserved.',
            'related_content' => 'Related Content',
            'view_tool' => 'Explore Tool',
            'back_to' => 'Back to',
            'choose_course_date' => 'Choose the course date',
            'no_rounds_available' => 'No upcoming rounds available at the moment.',
            'what_you_learn' => 'What You\'ll Learn',
            'value_bonuses' => 'Value & Bonuses',
            'student_outcomes' => 'Student Outcomes',
            'top_questions' => 'Top Questions',
            'all_questions' => 'All Questions',
        ],
        'ar' => [
            'home' => 'الرئيسية',
            'about' => 'من نحن',
            'training_program' => 'البرنامج التدريبي',
            'tools' => 'الأدوات',
            'excel' => 'إكسل',
            'power_bi' => 'باور بي آي',
            'statistics' => 'الإحصاء',
            'sql' => 'SQL',
            'contact' => 'اتصل بنا',
            'contact_us' => 'تواصل معنا',
            'send_message' => 'إرسال رسالة',
            'name' => 'الاسم',
            'email' => 'البريد الإلكتروني',
            'phone' => 'رقم الهاتف',
            'message' => 'الرسالة',
            'submit' => 'إرسال',
            'enroll_now' => 'سجل الآن',
            'read_more' => 'اقرأ المزيد',
            'explore_topics' => 'استكشف مواضيعنا',
            'explore_tools' => 'استكشف الأدوات',
            'why_data_analysis' => 'لماذا تحليل البيانات؟',
            'benefits' => 'الفوائد الرئيسية',
            'testimonials' => 'ماذا يقول طلابنا',
            'faq' => 'الأسئلة الشائعة',
            'site_links' => 'روابط الموقع',
            'follow_us' => 'تابعنا',
            'copyright' => '© ' . date('Y') . ' ' . ($settings['site_name_ar'] ?? 'تعلم تحليل البيانات') . '. جميع الحقوق محفوظة.',
            'related_content' => 'محتوى ذو صلة',
            'view_tool' => 'استكشف الأداة',
            'back_to' => 'العودة إلى',
            'choose_course_date' => 'اختَر موعد الدورة',
            'no_rounds_available' => 'لا توجد مواعيد متاحة حاليًا.',
            'what_you_learn' => 'ماذا ستتعلم',
            'value_bonuses' => 'قيمة مضافة ومزايا',
            'student_outcomes' => 'لماذا هذا البرنامج',
            'top_questions' => 'أهم الأسئلة',
            'all_questions' => 'جميع الأسئلة',
        ]
    ];
    return $translations[$lang][$key] ?? $key;
}

// Get current page name from URL
function getCurrentPage() {
    $page = basename($_SERVER['PHP_SELF'], '.php');
    return $page;
}

// Preserve language parameter in URLs
function preserveLang($url, $lang) {
    $separator = (strpos($url, '?') !== false) ? '&' : '?';
    return $url . $separator . 'lang=' . $lang;
}
function getCardSummaryText(array $item, string $lang, ?int $maxChars = null): string {
    $preferredOrder = [
        'summary_' . $lang,
        'summary_' . ($lang === 'ar' ? 'en' : 'ar'),
        'body_' . $lang,
        'body_' . ($lang === 'ar' ? 'en' : 'ar'),
    ];

    $text = '';
    foreach ($preferredOrder as $field) {
        if (!isset($item[$field])) {
            continue;
        }

        $candidate = is_string($item[$field]) ? trim($item[$field]) : '';
        if ($candidate === '') {
            continue;
        }

        $candidate = strip_tags($candidate);
        if ($candidate !== '') {
            $text = $candidate;
            break;
        }
    }

    if ($text === '') {
        return '';
    }

    $text = preg_replace('/\s+/u', ' ', $text);

    if ($maxChars !== null && $maxChars > 0) {
        $lengthFunc = function_exists('mb_strlen')
            ? fn($str) => mb_strlen($str, 'UTF-8')
            : fn($str) => strlen($str);
        $substrFunc = function_exists('mb_substr')
            ? fn($str, $start, $length) => mb_substr($str, $start, $length, 'UTF-8')
            : fn($str, $start, $length) => substr($str, $start, $length);

        if ($lengthFunc($text) > $maxChars) {
            $text = $substrFunc($text, 0, $maxChars);
            $text = rtrim($text, " \t\n\r\0\x0B,.;:!؟،");
            $text .= '…';
        }
    }

    return $text;
}
function getTopicHeroGradient(string $slug): string {
    $overlays = [
        'excel' => ['rgba(46, 125, 50, 0.85)', 'rgba(27, 94, 32, 0.85)'],
        'power-bi' => ['rgba(255, 196, 0, 0.85)', 'rgba(204, 120, 0, 0.85)'],
        'sql' => ['rgba(63, 81, 181, 0.85)', 'rgba(33, 53, 140, 0.85)'],
        'statistics' => ['rgba(0, 150, 136, 0.85)', 'rgba(0, 105, 92, 0.85)'],
    ];

    if (isset($overlays[$slug])) {
        return 'linear-gradient(' . $overlays[$slug][0] . ', ' . $overlays[$slug][1] . ')';
    }

    return 'linear-gradient(rgba(168, 50, 78, 0.85), rgba(108, 30, 53, 0.85))';
}
?>
