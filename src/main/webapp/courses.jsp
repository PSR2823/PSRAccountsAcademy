<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    body {
        margin: 0;
        font-family: 'Georgia', Times, serif;
        background-color: #f9f9f9;
    }

    @media (min-width: 1024px) {
        #banner-image {
            height: 400px; /* A specific height for larger screens like desktops/laptops */
        }
    }

    @media (max-width: 1023px) {
        #banner-image {
            height: 250px; /* A smaller height for tablets and mobile screens */
        }
    }

    @media (max-width: 767px) {
        #banner-image {
            height: 200px; /* An even smaller height for small phones */
        }
    }

    @keyframes fadeInOut {
        0%, 100% {
            opacity: 1;
        }
        50% {
            opacity: 0;
        }
    }

    #banner-image {
        animation: fadeInOut 10s infinite; /* Optional: Adds fading animation */
    }
</style>


    <script>
        // JavaScript for filtering courses
        function filterCourses(category) {
            const allCards = document.querySelectorAll(".course-card");
            allCards.forEach(card => {
                if (category === "all" || card.dataset.category === category) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            });

            // Change label styles
            const allLabels = document.querySelectorAll(".course-label");
            allLabels.forEach(label => {
                if (label.dataset.category === category) {
                    label.classList.add("bg-black", "text-white");
                    label.classList.remove("bg-gray-200", "hover:bg-gray-600");
                } else {
                    label.classList.add("bg-gray-200", "hover:bg-gray-600");
                    label.classList.remove("bg-black", "text-white");
                }
            });
        }
    </script>
</head>
<body class="bg-gray-100">

   <!-- Navbar Section -->
    <nav class="bg-white shadow-lg">
        <div class="container mx-auto flex items-center justify-between py-4">
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

    <!-- Main Content Section -->
   
    <!-- Full Page Wrapper -->
    <div class="flex flex-col lg:flex-row h-auto bg-white border border-gray-300">
        <!-- Sidebar -->
        <div class="w-full lg:w-1/4 bg-white text-black p-4">
            <ul>
                <li class="course-label mb-2 p-2 rounded cursor-pointer bg-black text-white" data-category="all" onclick="filterCourses('all')">
                    All Courses
                </li>
                <li class="course-label mb-2 p-2 rounded cursor-pointer bg-gray-200 hover:bg-gray-600 hover:text-white" data-category="jracc" onclick="filterCourses('jracc')">
                   Junior Level Accounts
                </li>
                <li class="course-label mb-2 p-2 rounded cursor-pointer bg-gray-200 hover:bg-gray-600 hover:text-white" data-category="sracc" onclick="filterCourses('sracc')">
                    Senior Level Accounts
                </li>
                <li class="course-label mb-2 p-2 rounded cursor-pointer bg-gray-200 hover:bg-gray-600 hover:text-white" data-category="idtc" onclick="filterCourses('idtc')">
                    Industrial Accounts & Taxation Course
                </li>
            </ul>
        </div>

        <!-- Vertical Divider -->
       <div class="hidden lg:block w-[1px] bg-gray-300"></div>

       <!-- Course List -->
        <div class="w-full lg:w-3/4 p-4">
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                <!-- Course Card 1 -->
                <div class="course-card bg-white shadow-lg rounded-lg p-4 border border-gray-300" data-category="jracc">
                    <div class="mb-4">
                        <img src="jr.png" alt="Jr acc" class="w-full h-40 object-cover rounded-t-lg">
                    </div>
                    <h3 class="text-lg font-bold text-blue-900">Junior Level Accounting Course</h3>
                    <p class="text-gray-600 mb-2">Duration: 45 Days</p>
                    <p class="text-gray-600 mb-4">Rating: ⭐⭐⭐⭐⭐</p>
                    <a href="accounts" target="_blank">
                        <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700 w-full">
                            View More
                        </button>
                    </a>
                </div>

                <!-- Course Card 2 -->
                <div class="course-card bg-white shadow-lg rounded-lg p-4 border border-gray-300" data-category="sracc">
                    <div class="mb-4">
                        <img src="sr.png" alt="Sr acc" class="w-full h-40 object-cover rounded-t-lg">
                    </div>
                    <h3 class="text-lg font-bold text-green-700">Senior Level Accounting Course</h3>
                    <p class="text-gray-600 mb-2">Duration: 2 Months</p>
                    <p class="text-gray-600 mb-4">Rating: ⭐⭐⭐⭐⭐</p>
                    <a href="sracc" target="_blank">
                        <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700 w-full">
                            View More
                        </button>
                    </a>
                </div>

                <!-- Course Card 3 -->
                <div class="course-card bg-white shadow-lg rounded-lg p-4 border border-gray-300" data-category="idtc">
                    <div class="mb-4">
                        <img src="indacc.png" alt="Ind acc" class="w-full h-40 object-cover rounded-t-lg">
                    </div>
                    <h3 class="text-lg font-bold text-orange-700">Industrial Accounts & Taxation course</h3>
                    <p class="text-gray-600 mb-2">Duration: 3 Months</p>
                    <p class="text-gray-600 mb-4">Rating: ⭐⭐⭐⭐⭐</p>
                    <a href="indacc" target="_blank">
                        <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700 w-full">
                            View More
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
