<?php

function slugify($string) {
    $preps = array('in', 'at', 'on', 'by', 'into', 'off', 'onto', 'from', 'to', 'with', 'a', 'an', 'the', 'using', 'for');
    $pattern = '/\b(?:' . join('|', $preps) . ')\b/i';
    $string = preg_replace($pattern, '', $string);
    
    // Replace spaces and special characters with hyphens
    $string = preg_replace('~[^\pL\pN]+~u', '-', $string);
    $string = trim($string, '-');
    
    // Convert to lowercase for case-insensitive slugs
    $string = mb_strtolower($string, 'UTF-8');

    // Remove any unwanted characters that are not letters, numbers, or hyphens
    $string = preg_replace('~[^\pL\pN-]+~u', '', $string);
    
    return $string;
}

?>
