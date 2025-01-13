<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.model.Register" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.springboot.model.Student" %>
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
    <title>Student Courses</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
    @media (max-width: 768px) {
    /* Sidebar adjustments for mobile screens */
    aside {
        width: 100%;
        position: relative;
        top: 0;
        left: 0;
    }

    nav ul {
        flex-direction: column;
    }

    nav ul li {
        flex: 1;
        text-align: center;
    }

    /* Main content adjustments for mobile screens */
    .container {
        margin-top: 4rem; /* Adding space for the main content on mobile */
        padding: 2rem;
    }

    .table-responsive {
        overflow-x: auto;
    }

    /* Navbar adjustments for mobile screens */
    nav.navbar {
        flex-direction: column;
        justify-content: flex-end;
    }

    /* Navbar user dropdown adjustments for mobile */
    #navbar-user-dropdown {
        right: auto;
        left: 0;
    }

    /* Modal adjustments */
    #syllabusModal {
        padding: 1rem;
        max-width: 100%;
        width: 90%;
    }
}
    
    </style>
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
            <nav class="bg-white text-gray-800 shadow-md py-16 flex justify-end items-center px-4">
                <div class="relative">
                    <button 
                        onclick="toggleDropdown('navbar-user-dropdown')" 
                        class="focus:outline-none">
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
        <div class="container mx-auto mt-12">
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h1 class="text-xl font-bold text-center text-gray-800 mb-6">My Registered Courses</h1>

                <c:if test="${empty register}">
                    <div class="text-center">
                        <p class="text-red-600 font-bold mb-4">Currently, there are no Registered Courses</p><br>
                        <a href="displaycourses" class="bg-green-800 text-white py-2 px-4 rounded-lg hover:bg-green-700">
                           Click here to Register the Courses
                        </a>
                    </div>
                </c:if>

                <c:if test="${not empty register}">
                    <table class="min-w-full bg-white rounded-lg shadow-md border-collapse border border-gray-300">
                        <thead class="bg-gray-700 text-white">
                            <tr>
                                <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Course ID</th>
                                <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Course Name</th>
                                <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Duration</th>
                                <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Syllabus</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${register}" var="reg">
                                <tr class="${(reg.courseid.id % 2 == 0) ? 'bg-gray-100' : 'bg-yellow-100'} border border-gray-300">
                                    <td class="px-6 py-4 border border-gray-400 font-bold bg-white">${reg.courseid.id}</td>
                                    <td class="px-6 py-4 border border-gray-400 font-bold bg-white">${reg.courseid.name}</td>
                                    <td class="px-6 py-4 border border-gray-400 font-bold bg-white">${reg.courseid.duration}</td>
                                    <td class="px-6 py-4 border border-gray-400 bg-white">
                                        <button onclick="openModal(this)" data-syllabus="<c:out value='${reg.courseid.details}' escapeXml='true' />" class="inline-block bg-green-500 text-white py-1 px-3 rounded-lg hover:bg-green-600">
                                            <i class="fas fa-info-circle"></i>&nbsp;&nbsp;&nbsp; View Syllabus
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
  
    <!-- Modal Structure -->
    <div id="syllabusModal" class="hidden fixed inset-0 bg-gray-900 bg-opacity-50 flex items-center justify-center">
        <div class="bg-white p-6 rounded-lg w-full max-w-md">
            <h2 class="text-xl font-bold mb-4">Syllabus Details</h2>
            <p id="syllabusContent" class="text-gray-800"></p><br><br>
            <button onclick="closeModal()" class="bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-500">
            Close
            </button>
        </div>
    </div>

    <!-- JavaScript for Modal -->
    <script>
        function openModal(button) {
            const syllabus = button.getAttribute("data-syllabus");
            document.getElementById("syllabusContent").innerText = syllabus;
            document.getElementById("syllabusModal").classList.remove("hidden");
        }

        function closeModal() {
            document.getElementById("syllabusModal").classList.add("hidden");
        }

        function toggleDropdown() {
            const dropdownMenu = document.querySelector('.dropdown-menu');
            dropdownMenu.classList.toggle('hidden');
        }
    </script>
 <script>
        function toggleDropdown(id) {
            const dropdown = document.getElementById(id);
            dropdown.classList.toggle('hidden');
        }
    </script>
</body>
</html>
