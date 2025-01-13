<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("studentsessionexpiry");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // JavaScript to toggle dropdown visibility
        function toggleDropdown(dropdownId) {
            const dropdown = document.getElementById(dropdownId);
            dropdown.classList.toggle('hidden');
        }
    </script>
</head>
<body class="bg-gray-100 h-screen">
    <!-- Main Wrapper -->
    <div class="flex h-screen">

        <!-- Sidebar -->
        <aside class="bg-gray-800 text-white w-64 flex flex-col">
            <!-- Top Image Section -->
            <div class="bg-white p-4">
                <a href="studenthome" class="flex items-center">
                <img src="psr.png" alt="PSR Academy Logo" class="w-full h-32 object-cover rounded-md shadow-md">
                </a>
            </div>
            <!-- Sidebar Links -->
            <nav class="flex-grow">
                <ul class="space-y-2">
                    <li class="flex items-center px-4 py-3 bg-gray-700 rounded-md">
                        <i class="fas fa-book text-white mr-3"></i>
                        <a href="registercourses" class="text-white font-semibold">My Courses</a>
                    </li>
                    <li class="flex items-center px-4 py-3 bg-gray-700 rounded-md">
                        <i class="fas fa-plus-circle text-white mr-3"></i>
                        <a href="displaycourses" class="text-white font-semibold">Enroll For Course</a>
                    </li>
                    <!-- Profile Dropdown -->
                    <li>
                        <button 
                            class="flex items-center w-full px-4 py-3 bg-gray-700 rounded-md focus:outline-none"
                            onclick="toggleDropdown('profile-dropdown-sidebar')">
                            <i class="fas fa-user text-white mr-3"></i>
                            <span class="font-semibold">Profile</span>
                            <i class="fas fa-chevron-down ml-auto"></i>
                        </button>
                        <ul id="profile-dropdown-sidebar" class="hidden bg-gray-600 text-sm mt-1 rounded-md">
                            <li class="flex items-center px-4 py-3">
                                <i class="fas fa-key text-white mr-3"></i>
                                <a href="changepassword" class="text-white">Change Password</a>
                            </li>
                            <li class="flex items-center px-4 py-3">
                                <i class="fas fa-edit text-white mr-3"></i>
                                <a href="updatestudentprofile" class="text-white">Edit Profile</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col">
            <!-- Navbar -->
           <nav class="bg-white text-gray-800 shadow-md py-16 flex justify-between items-center">
    <!-- Left Section (optional logo/logo text if any) -->
    <!-- Right Section: User Icon -->
    <div class="relative">
        <button 
            onclick="toggleDropdown('navbar-user-dropdown')" 
            class="focus:outline-none">
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="fas fa-user-circle text-3xl text-gray-800"></i>

        </button>
        <ul 
            id="navbar-user-dropdown" 
            class="hidden absolute right-0 mt-2 bg-white shadow-md rounded-md text-sm w-48">
            <li class="px-4 py-3 hover:bg-gray-100">
                <a href="studentprofile" class="text-black text-xl font-bold">Profile</a>
            </li>
            <li class="px-4 py-3 hover:bg-gray-100">
                <a href="studentlogout" class="text-black text-xl font-bold">Logout</a>
            </li>
        </ul>
    </div>
</nav>

            <!-- Main Content Area -->
 <main class="flex-grow pt-20 px-8">
    <h3 class="text-center text-lg font-semibold underline mb-6">My Profile</h3>
    <div class="max-w-4xl mx-auto bg-blue-200 p-6 rounded-lg shadow-lg space-y-6">
        <div class="grid grid-cols-2 gap-6">
            <!-- Name -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Name</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getName() %></p>
            </div>

            <!-- Gender -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Gender</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getGender() %></p>
            </div>

            <!-- DOB -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Date of Birth</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getDob() %></p>
            </div>

            <!-- Email -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Email</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getEmail() %></p>
            </div>

            <!-- Location -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Location</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getAddress() %></p>
            </div>

            <!-- Qualification -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Qualification</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getQualification() %></p>
            </div>

            <!-- Experience -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Experience</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getExperience() %></p>
            </div>

            <!-- Contact -->
            <div class="bg-yellow-100 p-6 rounded-lg shadow-lg">
                <label class="block font-medium text-gray-600">Contact</label>
                <p class="text-gray-800 font-semibold mt-2"><%= student.getMobileno() %></p>
            </div>
        </div>
    </div>
</main>
 


    <!-- Font Awesome for Icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>
