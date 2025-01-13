<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <div class="flex justify-center items-center h-screen">
        <div class="bg-white p-8 rounded-lg shadow-lg w-96">
            <h3 class="text-2xl font-bold text-center text-gray-700 mb-6">Change Password</h3>
            <form method="post" action="update-change-password" class="space-y-4">
                <!-- ID Field -->
                <div>
		            <label for="sid" class="block font-medium">Student ID</label>
		            <input type="number" id="sid" name="sid" class="w-full px-4 py-2 border rounded-md" value="<%= student.getId() %>" readonly required />
		        </div>
                <!-- Password Field -->
             <div class="relative">
    <label for="spwd" class="block font-medium text-gray-600 mb-1">New Password</label>
    <div class="flex items-center border rounded-md">
        <input 
            type="password" 
            id="spwd" 
            name="spwd" 
            class="w-full px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500" 
             
            placeholder="Enter your new password" 
            required 
        />
        <button 
            type="button" 
            class="px-2 text-gray-600 hover:text-gray-800 focus:outline-none" 
            onclick="togglePasswordVisibility()"
        >
            <svg id="eyeIcon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12m-7.5 0a7.5 7.5 0 1 0 15 0a7.5 7.5 0 1 0-15 0" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12m-3 0a3 3 0 1 0 6 0a3 3 0 1 0-6 0" />
            </svg>
        </button>
    </div>
</div>

<script>
    function togglePasswordVisibility() {
        const passwordField = document.getElementById('spwd');
        const eyeIcon = document.getElementById('eyeIcon');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            eyeIcon.innerHTML = `
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a9 9 0 1 1-18 0a9 9 0 1 1 18 0" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 12m-2.5 0a2.5 2.5 0 1 1 5 0a2.5 2.5 0 1 1-5 0" />
            `;
        } else {
            passwordField.type = 'password';
            eyeIcon.innerHTML = `
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12m-7.5 0a7.5 7.5 0 1 0 15 0a7.5 7.5 0 1 0-15 0" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12m-3 0a3 3 0 1 0 6 0a3 3 0 1 0-6 0" />
            `;
        }
    }
</script>


                <!-- Submit Button -->
                <div class="flex justify-center">
                    <button type="submit" class="bg-blue-500 text-white px-6 py-2 rounded hover:bg-blue-600">
                        Update Password
                    </button>
                </div>
            </form>
        </div>
    </div>
     <!-- Font Awesome for Icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>
