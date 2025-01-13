<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PSR Academy</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        // JavaScript to toggle the dropdown
        function toggleDropdown() {
            const dropdown = document.getElementById('account-dropdown');
            dropdown.classList.toggle('hidden');
        }
    </script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-800">

    <!-- Marquee Section for announcements -->
    <marquee 
        style="font-family: Georgia, Times New Roman, Times, serif; font-size: 1.25rem; padding: 10px; color: white;" 
        bgcolor="brown"
    >
        <b class="font-bold text-xl">Classes will begin soon</b>
    </marquee>

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


<!-- Main Content -->
<div class="flex items-center justify-center min-h-[calc(100vh-80px)] gap-8 p-4"> 
    <!-- Image Section -->
    <!-- <div class="flex items-center justify-center w-full h-[500px]">
    <img 
        src="psrbanner.jpg" 
        alt="PSR Academy Logo" 
        class="w-auto h-full object-cover rounded-lg shadow-lg"
        style="image-rendering: auto;">
</div> -->


    <!-- Login Card -->
    <div class="bg-white p-6 rounded-lg max-w-lg w-full md:w-[800px] shadow-lg flex flex-col items-center justify-center">
        <h2 class="text-2xl font-bold mb-4 text-center text-gray-800">Student Login</h2>
        <% 
            String loginMessage = (String) request.getAttribute("loginMessage");
            
            
        %>
             
        <% 
            
            if (loginMessage != null) { 
        %>
            <div class="bg-red-200 border-l-4 border-red-500 text-red-700 p-4 mb-4 rounded-md" role="alert">
                <p><%= loginMessage %></p>
            </div>
        <% } %>
        <form method="post" action="checkstudentlogin" class="space-y-6 w-full">
            <div class="flex flex-col space-y-2">
                <label for="semail" class="block text-sm text-gray-700 font-bold">Enter Email</label>
                <div class="relative">
                    <input 
                        type="text" 
                        id="semail" 
                        name="semail" 
                        required 
                        class="w-full bg-gray-100 text-gray-800 font-semibold p-3 pl-12 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                        placeholder="Your Email"
                    >
                    <div class="absolute left-4 top-1/2 transform -translate-y-1/2">
                        <i class="fas fa-user text-gray-500"></i>
                    </div>
                </div>
            </div>
     <div class="flex flex-col space-y-2">
    <label for="spwd" class="block text-sm text-gray-700 font-bold">Enter Password</label>
    <div class="relative">
        <input 
            type="password" 
            id="spwd" 
            name="spwd" 
            required 
            class="w-full bg-gray-100 text-gray-800 font-semibold p-3 pl-12 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
            placeholder="Your Password"
        >
        <div class="absolute left-4 top-1/2 transform -translate-y-1/2">
            <i class="fas fa-lock text-gray-500"></i>
        </div>
        <div class="absolute right-4 top-1/2 transform -translate-y-1/2">
            <i id="eyeIcon" class="fas fa-eye text-gray-500 cursor-pointer"></i>
        </div>
    </div>
</div>

<script>
    document.getElementById('eyeIcon').addEventListener('click', togglePasswordVisibility);

    function togglePasswordVisibility() {
        const passwordField = document.getElementById('spwd');
        const eyeIcon = document.getElementById('eyeIcon');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            eyeIcon.classList.remove('fa-eye'); // Remove eye icon
            eyeIcon.classList.add('fa-eye-slash'); // Show eye-slash icon
        } else {
            passwordField.type = 'password';
            eyeIcon.classList.remove('fa-eye-slash'); // Remove eye-slash icon
            eyeIcon.classList.add('fa-eye'); // Show eye icon
        }
    }
</script>


            <div class="flex justify-between items-center mt-4">
                <button 
                    type="submit" 
                    class="bg-gray-700 hover:bg-gray-800 text-white py-2 px-6 rounded transition duration-300 text-sm font-semibold flex items-center space-x-2"
                >
                    <i class="fas fa-sign-in-alt"></i>
                    <span>Sign In</span>
                </button>
                <input 
                    type="reset" 
                    value="Clear" 
                    class="bg-gray-400 hover:bg-gray-500 text-white py-2 px-4 rounded transition duration-300 text-sm font-semibold"
                >
            </div>
        </form>
        
        <!-- Register Here Link -->
        <div class="mt-8 text-sm text-gray-600 text-center">
            <p class="mb-2 font-semibold text-black text-2xl">New Student ?
            <a href="studentreg" class="text-red-500 hover:text-red-600 hover:underline font-bold text-xl">
                Click Here for registration
            </a></p>
        </div>
    </div>
</div>

</body>
</html>
