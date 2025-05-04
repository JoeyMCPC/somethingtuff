<?php
function filter_message($message) {
    $bad_words = [
        'hitler', 'nigger', 'nigga', 'faggot', 'retard', 'cunt',
        'bitch', 'fuck', 'shit', 'asshole', 'kike', 'spic',
        'chink', 'tranny', 'dick', 'cock'
    ];

    $normalized = strtolower($message);
    $normalized = preg_replace('/[^a-z0-9]/', '', $normalized);
    $normalized = preg_replace('/\s+/', '', $normalized);

    foreach ($bad_words as $bad) {
        if (strpos($normalized, $bad) !== false) {
            $pattern = '/' . implode('\s*', str_split($bad)) . '/i';
            $message = preg_replace($pattern, str_repeat('*', strlen($bad)), $message);
        }
    }

    return $message;
}
?>

