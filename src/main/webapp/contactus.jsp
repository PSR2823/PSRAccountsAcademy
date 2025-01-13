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
        
        function validateMobile() {
            const mobileInput = document.getElementById('mobile');
            const errorMessage = document.getElementById('mobile-error');
        
            // Check if the mobile number length is exactly 10 and it is a number
            if (mobileInput.value.length !== 10 || isNaN(mobileInput.value)) {
                errorMessage.classList.remove('hidden');
                mobileInput.classList.add('border-red-500');
                return false; // Mobile number is invalid
            } else {
                errorMessage.classList.add('hidden');
                mobileInput.classList.remove('border-red-500');
                return true; // Mobile number is valid
            }
        }

        function validateForm() {
            // Validate the mobile number
            if (validateMobile()) {
                return true; // Proceed with form submission
            } else {
                return false; // Prevent form submission if validation fails
            }
        }
    </script>
    <style>
    @media (max-width: 768px) {
    .h-80 {
        height: 50vh; /* Adjusted height for mobile */
    }
}
    
    </style>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body class="bg-white text-gray-800">

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
    
   <!-- Banner Section -->
<div class="w-full h-80 bg-cover bg-center bg-no-repeat text-white" style="background-image: url('contactus.png');">
    <!-- This ensures the image covers the full area and looks good on mobile too -->
</div>

    <div class="container mx-auto px-4 mt-12">
        <div class="flex justify-center items-center space-x-8">
            <!-- Email Card -->
            <div
                class="bg-gray-200 hover:bg-yellow-200 shadow-lg rounded-lg p-6 text-center w-full md:w-1/3 flex flex-col justify-center"
                onmouseover="this.style.transform='scale(1.1)'; this.style.boxShadow='0 10px 20px rgba(0,0,0,0.2)';"
                onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 4px 10px rgba(0,0,0,0.1)';">
                <i class="fas fa-envelope text-red-500 text-4xl mb-4"></i>
                <p class="text-xl font-bold">
                    Email: <a href="mailto:psrao1977@gmail.com" class="text-blue-500 hover:underline">psrao1977@gmail.com</a>
                </p>
            </div>

            <!-- Location Card -->
            <div
                class="bg-gray-200 hover:bg-yellow-200 shadow-lg rounded-lg p-6 text-center w-full md:w-1/3 flex flex-col justify-center"
                onmouseover="this.style.transform='scale(1.1)'; this.style.boxShadow='0 10px 20px rgba(0,0,0,0.2)';"
                onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 4px 10px rgba(0,0,0,0.1)';">
                <i class="fas fa-map-marker-alt text-red-500 text-4xl mb-4"></i>
                <p class="text-xl">
                    Location: <br>
                    <span class="border-b border-gray-300">1-30-3, Sri Ramalayam Street, Kadakatla, Tadepalligudem,<br>
                        W.G District, Andhra Pradesh, 534101</span>
                </p>
            </div>

            <!-- Phone Card -->
            <div
                class="bg-gray-200 hover:bg-yellow-200 shadow-lg rounded-lg p-6 text-center w-full md:w-1/3 flex flex-col justify-center"
                onmouseover="this.style.transform='scale(1.1)'; this.style.boxShadow='0 10px 20px rgba(0,0,0,0.2)';"
                onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 4px 10px rgba(0,0,0,0.1)';">
                <i class="fas fa-phone-alt text-red-500 text-4xl mb-4"></i>
                <p class="text-xl font-bold">
                    Phone: <a href="tel:+917382682682" class="text-blue-500 hover:underline">+91 7382682682</a>
                </p>
            </div>
        </div>

        <!-- Contact Form Section -->
        <div class="flex justify-center items-center mt-12">
            <div class="bg-green-100 shadow-lg rounded-lg p-8 max-w-lg w-full">
                <h2 class="text-2xl font-bold text-black mb-4 text-center">Get in Touch</h2>
                <form method="post" action="sendemail" onsubmit="return validateForm()">
                    <div class="mb-4">
                        <label for="name" class="block text-xl font-bold text-black">Name</label>
                        <input type="text" id="name" name="name" placeholder="Enter Your Name" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="email" class="block text-xl font-bold text-black">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter Your Email" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                    <div>
                        <label for="mobile" class="block text-xl font-bold text-black">Mobile</label>
                        <input type="text" id="mobile" name="mobile" placeholder="Enter Your Mobile Number" required oninput="validateMobile()" class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                        <p id="mobile-error" class="text-red-600 font-bold text-xl hidden">Mobile number must be exactly 10 digits.</p>
                    </div>
                    <div>
                        <label for="subject" class="block text-xl font-bold text-black">Subject</label>
                        <textarea id="subject" name="subject" required rows="1" class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"></textarea>
                    </div>
                    <div class="mb-4">
                        <label for="message" class="block text-xl font-bold text-black">Message</label>
                        <textarea id="message" name="message" rows="4" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"></textarea>
                    </div>
                    <button type="submit" class="w-full bg-green-400 text-black py-2 px-4 rounded-md hover:bg-green-500">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
