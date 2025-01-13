<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	Student student = (Student) session.getAttribute("student");
	    if (student == null) 
	    {
	        response.sendRedirect("studentsessionexpiry.jsp");
	        return;
	    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update My Profile</title>
    
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
  <script>
        // JavaScript to toggle dropdown visibility
        function toggleDropdown(dropdownId) {
            const dropdown = document.getElementById(dropdownId);
            dropdown.classList.toggle('hidden');
        }
    </script>
    <style>
        /* Animation styles */
        .animated-card {
            opacity: 0;
            transform: translateY(50px);
            animation: fadeInUp 1s ease forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body class="bg-gray-100 h-screen">
    <!-- Main Wrapper -->
    <div class="flex h-screen">
        <!-- Sidebar -->
        <aside class="bg-gray-800 text-white w-64 flex flex-col">
            <div class="bg-white p-4">
                <a href="studenthome" class="flex items-center">
                <img src="psr.png" alt="PSR Academy Logo" class="w-full h-32 object-cover rounded-md shadow-md">
                </a>
            </div>
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
                                <a href="editprofile" class="text-white">Edit Profile</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col">
            <nav class="bg-white text-gray-800 shadow-md py-16 flex justify-between items-center">
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

        <!-- Update Customer Form -->
      <main class="flex-grow pt-20 px-8">
    <h3 class="text-center text-lg font-semibold underline mb-6">Update My Profile</h3>
   <div class="max-w-4xl mx-auto bg-white p-6 rounded-lg shadow-lg">
    <form method="post" action="update-student-profile" class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <!-- ID -->
        <div>
            <label for="sid" class="block font-medium">Student ID</label>
            <input type="number" id="sid" name="sid" class="w-full px-4 py-2 border rounded-md" value="<%= student.getId() %>" readonly required />
        </div>
        <!-- Name -->
        <div>
            <label for="sname" class="block font-medium">Name</label>
            <input type="text" id="sname" name="sname" class="w-full px-4 py-2 border rounded-md" value="<%= student.getName() %>" required />
        </div>
        <!-- Gender -->
        <div class="col-span-2 md:col-span-1">
            <label class="block text-lg font-medium text-gray-700">Select Gender</label>
            <div class="flex space-x-4 mt-2">
                <div>
                    <input class="form-radio text-indigo-600" type="radio" id="male" name="sgender" value="MALE" />
                    <label class="ml-2 text-gray-700" for="male">Male</label>
                </div>
                <div>
                    <input class="form-radio text-indigo-600" type="radio" id="female" name="sgender" value="FEMALE" />
                    <label class="ml-2 text-gray-700" for="female">Female</label>
                </div>
            </div>
        </div>
        <!-- DOB -->
        <div>
            <label for="sdob" class="block font-medium">Date of Birth</label>
            <input type="text" id="sdob" name="sdob" class="w-full px-4 py-2 border rounded-md" value="<%= student.getDob() %>" required />
        </div>
        <!-- Email -->
        <div>
            <label for="semail" class="block font-medium">Email</label>
            <input type="email" id="semail" name="semail" class="w-full px-4 py-2 border rounded-md" value="<%= student.getEmail() %>" required />
        </div>
        <!-- Location -->
        <div>
            <label for="splace" class="block font-medium">Location</label>
            <input type="text" id="splace" name="splace" class="w-full px-4 py-2 border rounded-md" value="<%= student.getAddress() %>" required />
        </div>
        <!-- Qualification -->
        <div>
            <label for="squalification" class="block font-medium">Qualification</label>
            <input type="text" id="squalification" name="squalification" class="w-full px-4 py-2 border rounded-md" value="<%= student.getQualification() %>" required />
        </div>
        <!-- Experience -->
        <div>
            <label for="sexperience" class="block font-medium">Experience</label>
            <input type="text" id="sexperience" name="sexperience" class="w-full px-4 py-2 border rounded-md" value="<%= student.getExperience() %>" required />
        </div>
        <!-- Contact -->
        <div>
            <label for="smobileno" class="block font-medium">Contact</label>
            <input type="text" id="smobileno" name="smobileno" class="w-full px-4 py-2 border rounded-md" value="<%= student.getMobileno() %>" required />
        </div>
        <!-- Buttons -->
        <div class="col-span-2 flex justify-between mt-4">
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Update</button>
            <button type="reset" class="bg-red-500 text-white px-4 py-2 rounded">Clear</button>
        </div>
    </form>
</div>
</main>

    </div>
</body>
</html>
