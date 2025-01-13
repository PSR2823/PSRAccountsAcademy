<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IA & Taxation</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        .pdf-container {
            height: 100%;
            width: 100%;
        }
        .pdf-embed {
            height: 100%;
            width: 100%;
            border: none;
        }
        .download-btn-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="pdf-container">
        <!-- Embed Full-Page PDF -->
        <embed 
            src="files/Ia & TC.pdf" 
            type="application/pdf" 
            class="pdf-embed"
        />
    </div>
 
</body>
</html>
