<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PSR Academy - Empowering Your Career</title>
    <!-- Tailwind CSS and Font Awesome for styling -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Georgia', Times, serif;
            background-color: #f9f9f9;
        }
        /* Banner image fade-in animation */
        #banner-image {
            animation: fadeInOut 10s infinite;
        }
        @keyframes fadeInOut {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0;
            }
        }
        
    </style>
</head>
<body class="bg-white text-gray-800">

    <!-- Marquee Section for announcements -->
    <marquee style="font-size: 1.25rem; padding: 10px; color: white;" bgcolor="brown">
        <b class="font-bold text-xl">Classes will begin soon</b>
    </marquee>

    <!-- Navbar Section -->
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
            <img id="banner-image" src="banner2.png" alt="Banner Image" class="object-cover w-full h-[556px] rounded-lg shadow-lg">
        </div>
    </div>

    <script>
        // Banner rotation logic
        const banners = ["banner2.png", "banner3.png", "banner1.png"];
        const bannerImage = document.getElementById("banner-image");
        let currentIndex = 0;

        function changeBanner() {
            currentIndex = (currentIndex + 1) % banners.length;
            bannerImage.src = banners[currentIndex];
        }

        setInterval(changeBanner, 3500);

         
    </script>

    <!-- Content Section -->
    <div class="max-w-6xl mx-auto mt-12">
        <h2 class="text-black font-bold text-2xl text-center">Empowering Your Career Through Professional Accounting Training</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 mt-8">
            <!-- Course Cards -->
            <div class="bg-white shadow-lg rounded-lg p-4 border border-gray-300">
                <img src="jr.png" alt="Junior Course" class="w-full h-37 object-cover rounded-t-lg">
                <h3 class="text-lg font-bold text-blue-900 mt-4">Junior Level Accounting Course</h3>
                <p class="text-gray-600 font-bold mt-2">Duration: 45 Days</p>
                <p class="text-gray-600 mt-2 font-bold text-xl">Rating: &#9733;&#9733;&#9733;&#9733;&#9733;</p>
                <a href="accounts" target="_blank" class="block mt-4">
                    <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700 w-full">View More</button>
                </a>
            </div>
            <div class="bg-white shadow-lg rounded-lg p-4 border border-gray-300">
                <img src="sr.png" alt="Senior Course" class="w-full h-37 object-cover rounded-t-lg">
                <h3 class="text-lg font-bold text-blue-900 mt-4">Senior Level Accounting Course</h3>
                <p class="text-gray-600 font-bold mt-2">Duration: 2 Months</p>
                <p class="text-gray-600 mt-2 font-bold text-xl">Rating: &#9733;&#9733;&#9733;&#9733;&#9733;</p>
                <a href="sracc" target="_blank" class="block mt-4">
                    <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700 w-full">View More</button>
                </a>
            </div>
            <div class="bg-white shadow-lg rounded-lg p-4 border border-gray-300">
                <img src="indacc.png" alt="Industrial Course" class="w-full h-37 object-cover rounded-t-lg">
                <h3 class="text-lg font-bold text-blue-900 mt-4">Industrial Accounts & Taxation Course</h3>
                <p class="text-gray-600 font-bold mt-2">Duration: 3 Months</p>
                <p class="text-gray-600 mt-2 font-bold text-xl">Rating: &#9733;&#9733;&#9733;&#9733;&#9733;</p>
                <a href="indacc" target="_blank" class="block mt-4">
                    <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700 w-full">View More</button>
                </a>
            </div>
        </div>
    </div>
    
    <br><br>
    <h2 class="text-black font-bold text-2xl text-center">A Path to Bright Futures & Career Growth</h2><br>
    <h3 class="text-black text-xl text-center">Learn from Industry Experts for Hands-On Success</h3>

    <div class="flex justify-center space-x-8 mt-8">
        <div class="max-w-xs p-6 bg-gray-100 border border-gray-300 rounded-lg shadow-lg">
            <p class="text-black leading-relaxed text-center text-lg font-semibold">
                Offline Training
            </p>
        </div>

        <!-- Box 2: Online Training -->
        <div class="max-w-xs p-6 bg-gray-100 border border-gray-300 rounded-lg shadow-lg">
            <p class="text-black leading-relaxed text-center text-lg font-semibold">
                Online Training
            </p>
        </div>

        <!-- Box 3: Practice on Projects -->
        <div class="max-w-xs p-6 bg-gray-100 border border-gray-300 rounded-lg shadow-lg">
            <p class="text-black leading-relaxed text-center text-lg font-semibold">
                Weekly Sessions
            </p>
        </div>
    </div>

    <br><br>

    <h2 class="text-black font-bold text-2xl text-center">Our Training Features</h2> 
    <div class="max-w-6xl mx-auto mt-12">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 gap-4 justify-center">
            <!-- Course Card 1 -->
            <div class="bg-white shadow-lg rounded-lg p-4 border border-gray-300">
                <div class="flex flex-col items-center mb-4">
                    <!-- Clock with Checkmark Icon -->
                    <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-blue-900" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                    <!-- Title -->
                    <h3 class="text-lg font-bold text-blue-900 text-center">In-time Course <br> Completion</h3>
                </div>
                <!-- Description -->
                <p id="description-one" class="text-gray-600 font-bold mb-2">
                    Our courses are thoughtfully designed to blend theory with practical skills,
                    offering a well-rounded learning experience within a given time frame.
                </p>
            </div>

            <!-- Course Card 2 -->
<div class="bg-white shadow-lg rounded-lg p-4 border border-gray-300">
    <div class="flex flex-col items-center mb-4">
        <!-- Book Icon -->
        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-blue-900" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" strokeLinejoin="round" stroke-width="2" d="M5 5h14a2 2 0 012 2v12a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2zm0 4v8m8-8v8" />
            </svg>
        </div>
        <!-- Title -->
        <h3 class="text-lg font-bold text-blue-900 text-center">Comprehensive Learning</h3>
    </div>
    <!-- Description -->
    <p id="description-two" class="text-gray-600 font-bold mb-2">
        Our programs ensure deep understanding through interactive resources, hands-on projects, and personalized support.
    </p>
</div>



            <!-- Course Card 3 -->
            <!-- Course Card 3 -->
<div class="bg-white shadow-lg rounded-lg p-4 border border-gray-300">
    <div class="flex flex-col items-center mb-4">
        <!-- Person Icon -->
        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-blue-900" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" strokeLinejoin="round" stroke-width="2" d="M12 14c2.21 0 4 1.79 4 4v2H8v-2c0-2.21 1.79-4 4-4zm0-4c-1.11 0-2 .89-2 2v1H8a6 6 0 00-6 6v2h20v-2a6 6 0 00-6-6h-2v-1c0-1.11-.89-2-2-2zm-2-5h4V2h-4v3z" />
            </svg>
        </div>
        <!-- Title -->
        <h3 class="text-lg font-bold text-blue-900 text-center">Expert Faculty</h3>
    </div>
    <!-- Description -->
    <p id="description-three" class="text-gray-600 font-bold mb-2">
        Our team consists of industry experts who bring real-world experience and practical knowledge to our training programs.
    </p>
</div>

        </div>
    </div>

    <br><br>

</body>
</html>
