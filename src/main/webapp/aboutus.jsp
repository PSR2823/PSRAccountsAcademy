<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About PSR Accounts Academy</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Basic CSS animations for fading in the banner images */
        body {
            margin: 0; /* Remove default margin to allow full viewport height */
            font-family: 'Georgia', Times, serif; /* Optional: Set font-family if you wish */
            background-color: #f9f9f9; /* Optional: Background color for page */
        }

        .fade-in {
            opacity: 0;
            transform: scale(0.95);
            transition: opacity 0.5s ease-in-out, transform 0.5s ease-in-out;
        }

        .fade-in-visible {
            opacity: 1;
            transform: scale(1);
        }

        /* Adjust the image positioning to make them appear slightly higher */
        .image-container {
            margin-top: -20px; /* Move the image box up */
        }

        /* Dropdown menu styling */
        .dropdown-menu {
            z-index: 50; /* Ensure dropdown appears above other elements */
            position: absolute; /* Position dropdown relative to the parent element */
            width: auto; /* Allows dropdown to adjust based on content */
            max-width: 300px; /* Set maximum width */
            display: none; /* Dropdown hidden by default */
        }

        .dropdown-menu li a {
            white-space: nowrap; /* Prevent text wrapping */
            width: 100%; /* Make each link take full width */
        }

        /* Ensure dropdown appears when Courses link is clicked */
        .dropdown-menu.show {
            display: block; /* Show the dropdown when the class is applied */
        }

        /* Banner image styles */
        .banner-image {
            cursor: pointer; /* Pointer cursor for interactivity */
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-800 font-sans">
    <nav class="bg-white shadow-lg">
        <div class="container mx-auto flex items-center justify-between py-4">
            <!-- Logo -->
            <a href="main.jsp" class="flex items-center">
                <img src="psr.png" alt="PSR Academy Logo" class="w-20 h-18 object-cover rounded-lg shadow-lg">
            </a>

            <!-- Desktop Navbar -->
            <div class="hidden md:flex items-center space-x-6">
                <a href="main.jsp" class="font-bold hover:text-red-600">Home</a>
                <a href="courses" class="font-bold hover:text-red-600">Courses</a>
                <a href="contactus" class="font-bold hover:text-red-600">Contact Us</a>
                <a href="aboutus" class="font-bold hover:text-red-600">About</a>
                <div class="flex items-center">
                    <i class="fas fa-user-circle w-6 h-6 text-black mr-1"></i>
                    <a href="studentlogin" class="font-bold hover:text-red-600">Login</a>
                </div>
            </div>

            <!-- Mobile Dropdown Menu -->
            <div class="md:hidden">
                <button id="dropdown-menu" class="flex items-center space-x-2">
                    <i class="fas fa-bars text-black"></i>
                    <span class="font-bold text-black">Menu</span>
                </button>
                <div id="mobile-menu" class="hidden absolute top-16 right-0 bg-white shadow-lg rounded-lg p-4 w-48">
                    <a href="main.jsp" class="block py-2 text-black hover:bg-gray-100">Home</a>
                    <a href="courses" class="block py-2 text-black hover:bg-gray-100">Courses</a>
                    <a href="contactus" class="block py-2 text-black hover:bg-gray-100">Contact Us</a>
                    <a href="aboutus" class="block py-2 text-black hover:bg-gray-100">About</a>
                    <a href="studentlogin" class="block py-2 text-black hover:bg-gray-100">Login</a>
                </div>
            </div>
        </div>
    </nav>
     <script>
    // Toggle mobile menu
    const dropdownMenuButton = document.getElementById('dropdown-menu');
    const mobileMenu = document.getElementById('mobile-menu');

    dropdownMenuButton.addEventListener('click', () => {
        mobileMenu.classList.toggle('hidden');
    });
    </script>

    <!-- Banner Image Section -->
    <div class="relative mt-12 mx-auto w-4/5">
        <div class="w-full overflow-hidden relative">
            <img 
                id="banner-image" 
                src="about.png" 
                alt="Banner Image" 
                class="object-cover w-full h-[556px] banner-image cursor-pointer" 
            >
        </div>
    </div>

    <!-- About PSR Accounts Academy Section -->
    <div class="max-w-4xl mx-auto p-6">
        <!-- Aim, Vision, Motto sections -->
        <div class="mt-4 grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Aim Section -->
            <div class="bg-white p-6 rounded-lg">
                <p class="text-orange-600 font-semibold text-2xl">Aim</p>
                <p class="mt-2">
                    To provide employment for commerce students by giving accounting knowledge to students for making them skilled accountants, as per the requirements of the accounting sector.
                </p>
            </div>
            <!-- Vision Section -->
            <div class="bg-white p-6 rounded-lg">
                <p class="text-orange-600 font-semibold text-2xl">Vision</p>
                <p class="mt-2">
                    To create specialists in the accounting sector with good accounting knowledge.
                </p>
            </div>
            <!-- Motto Section -->
            <div class="bg-white p-6 rounded-lg">
                <p class="text-orange-600 font-semibold text-2xl">Motto</p>
                <p class="mt-2">
                    We make every commerce student a perfect accountant with our courses and help them get a good job without any experience.
                </p>
            </div>
        </div>
        <!-- Courses Offered -->
        <div class="mt-8">
            <h2 class="text-2xl font-bold text-gray-800">Courses Offered at PSR Accounts Academy</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-10 mt-8">
                <!-- Jr Level Accounting Course -->
                <div class="bg-green-100 p-8 rounded-lg shadow-lg w-full md:w-8/4">
                    <p class="text-black font-bold ">Jr Level Accounting Course</p><br>
                    <p class="text-red-600 font-bold text-xl ">Duration: 45 Days</p>
                </div>
                <!-- Sr Level Accounting Course -->
                <div class="bg-yellow-100 p-8 rounded-lg shadow-lg">
                    <p class="text-black font-bold ">Sr Level Accounting Course</p><br>
                    <p class="text-red-600 font-bold text-xl ">Duration: 60 Days</p>
                </div>
                <!-- Industrial Accounts & Taxation Course -->
                <div class="bg-blue-100 p-8 rounded-lg shadow-lg">
                    <p class="text-black font-bold">Industrial Accounts & Taxation Course</p><br>
                    <p class="text-red-600 font-bold text-xl ">Duration: 90 Days</p>
                </div>
            </div>
        </div>

        <!-- Syllabus Card -->
        <div class="bg-white p-6 rounded-lg shadow-lg">
            <h3 class="text-xl font-bold text-gray-800 mt-6">Topics:</h3>
            <ul class="list-disc list-inside text-gray-700 mt-4 space-y-2">
                <li>Final Accounts</li>
                <li>Inventory Management</li>
                <li>Depreciation</li>
                <li>All Statutory Permissions</li>
                <li>GST (GSTR-1, GSTR-3B, GSTR-9, etc.)</li>
                <li>E-Invoice & E-Waybills</li>
                <li>Income Tax, TDS & TCS</li>
                <li>EPF & ESI</li>
                <li>MS Office for Accounting</li>
                <li>Banking Related Works</li>
                <li>All Departments Related Works</li>
                <li>MIS Reports</li>
                <li>Insurance</li>
                <li>Maintenance of All Records</li>
                <li>Bank Loan Project Work (Working Capital Loan & Term Loans)</li>
            </ul>
        </div>

        <!-- Additional Details Section -->
        <div class="bg-red-100 p-6 mt-8">
            <p class="text-red-600 font-bold text-2xl">Offline classes only in Tadepalligudem. Online classes coming soon.</p><br>
            <p class="mt-2 text-black font-bold text-1xl">Timings:&nbsp; 6:15 AM to 7:15 AM & 7:30 AM to 8:45 AM</p><br>
            <p class="mt-2 text-black font-bold text-1xl">Free demo class available. Seats limited!</p>
        </div>
    </div>

   

    <script>
        // Dropdown Menu Script
        document.addEventListener('DOMContentLoaded', () => {
            const dropdownButton = document.getElementById('dropdown-menu');
            const mobileMenu = document.getElementById('mobile-menu');

            dropdownButton.addEventListener('click', () => {
                mobileMenu.classList.toggle('show');
            });

            const bannerImage = document.getElementById('banner-image');

            bannerImage.addEventListener('click', () => {
                // Toggle the dropdown menu when the image is clicked
                mobileMenu.classList.toggle('show');
            });
        });
    </script>
</body>
</html>
