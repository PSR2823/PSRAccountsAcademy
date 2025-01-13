<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Course Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
   
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
    @media (max-width: 768px) {
    .course-card {
        width: 100%; /* Full width on small screens */
        margin-bottom: 16px; /* Space between cards */
    }
    .course-label {
        padding: 10px; /* Add padding for better touch area */
    }
    .sidebar, .course-list {
        width: 100%; /* Full width for sidebar and course list on mobile */
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
                                <a href="editprofile" class="text-white">Edit Profile</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col">
            <!-- Navbar -->
            <nav class="bg-white text-gray-800 shadow-md py-4 flex justify-end items-center px-4">
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

            <!-- Main Content -->
            <div class="container mx-auto py-8">
                <h1 class="text-3xl font-bold text-center mb-6">Available Courses</h1>

                <!-- Filter Sidebar -->
                <div class="flex">
                    <aside class="w-full md:w-1/4 bg-white text-black p-6 h-full">
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
                    </aside>

                    <!-- Vertical Divider -->
                    <div class="w-[1px] bg-gray-300"></div>

                    <!-- Course List -->
                    <div class="w-full md:w-3/4 p-4 overflow-y-auto">
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                            <!-- Course Card 1 -->
                            <div class="course-card bg-white shadow-lg rounded-lg p-4 border border-gray-300" data-category="jracc">
                                <div class="mb-4">
                                    <img src="jr.png" alt="Jr acc" class="w-full h-32 object-cover rounded-t-lg">
                                </div>
                                <h3 class="text-lg font-bold text-blue-900">Junior Level Accounting Course</h3>
                                <p class="text-gray-600 mb-2">Duration: 45 Days</p>
                                <p class="text-gray-600 mb-4">Rating: <i class="fas fa-star text-yellow-500"></i>
                                    <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i>
                                </p>
                                <a href="accounts" target="_blank">
                                    <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700">
                                        View More
                                    </button>
                                </a>
                            </div>

                            <!-- Course Card 2 -->
                            <div class="course-card bg-white shadow-lg rounded-lg p-4 border border-gray-300" data-category="sracc">
                                <div class="mb-4">
                                    <img src="sr.png" alt="Sr Acc" class="w-full h-32 object-cover rounded-t-lg">
                                </div>
                                <h3 class="text-lg font-bold text-green-700">Senior Level Accounting Course</h3>
                                <p class="text-gray-600 mb-2">Duration: 2 Months</p>
                                <p class="text-gray-600 mb-4">Rating:<i class="fas fa-star text-yellow-500"></i>
                                    <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i>
                                </p>
                                <a href="sracc" target="_blank">
                                    <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700">
                                        View More
                                    </button>
                                </a>
                            </div>

                            <!-- Course Card 3 -->
                            <div class="course-card bg-white shadow-lg rounded-lg p-4 border border-gray-300" data-category="idtc">
                                <div class="mb-4">
                                    <img src="indacc.png" alt="Ind acc" class="w-full h-32 object-cover rounded-t-lg">
                                </div>
                                <h3 class="text-lg font-bold text-orange-700">Industrial Accounts & Taxation Course</h3>
                                <p class="text-gray-600 mb-2">Duration: 3 Months</p>
                                <p class="text-gray-600 mb-4">Rating:<i class="fas fa-star text-yellow-500"></i>
                                    <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i> <i class="fas fa-star text-yellow-500"></i>
                                </p>
                                <a href="indacc" target="_blank">
                                    <button class="bg-red-600 text-white py-2 px-4 rounded hover:bg-red-700">
                                        View More
                                    </button>
                                </a>
                            </div>
                        </div>

                        <!-- Regular Course Registration Section -->
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-6">
                            <c:forEach items="${clist}" var="course">
                                <div class="bg-blue-100 shadow-md rounded-lg p-6 flex flex-col justify-between">
                                    <div>
                                        <h2 class="text-xl font-bold text-red-700 mb-2"><c:out value="${course.name}" /></h2>
                                        <p class="text-sm text-gray-700 mb-4">
                                            Duration: <span class="font-bold"><c:out value="${course.duration}" /></span>
                                        </p>
                                    </div>
                                    <div class="mt-4 flex justify-between">			 
                                        <c:choose>
                                            <c:when test="${not registeredCourseIds.contains(course.id)}">
                                                <a href='<c:url value="course-register?cid=${course.id}&studentid=${student.id}" />'
                                                   class="inline-block bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-red-700">
                                                   Register
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <button disabled class="inline-block bg-gray-400 text-white py-2 px-4 rounded-lg">
                                                   Registered
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function toggleDropdown(id) {
            const dropdown = document.getElementById(id);
            dropdown.classList.toggle('hidden');
        }

        function filterCourses(category) {
            const cards = document.querySelectorAll('.course-card');
            cards.forEach(card => {
                if (category === 'all' || card.dataset.category === category) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
