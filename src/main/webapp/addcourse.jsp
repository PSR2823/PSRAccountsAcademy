<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%
Admin admin = (Admin) session.getAttribute("admin");
if(admin==null)
{
	response.sendRedirect("adminsessionexpiry");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Courses</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Framer Motion -->
    <script src="https://unpkg.com/framer-motion@6/dist/framer-motion.umd.js"></script>
</head>
<body class="bg-gray-300">
    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between">
        <div class="py-4 px-6">
            <h2 class="text-xl font-bold mb-6">Admin Menu</h2>
            <ul class="space-y-4">
                <li><a href="adminhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Home</a></li>
                <li><a href="viewallstudents" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Students</a></li>
                <li><a href="addcourse" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Add Course</a></li>
                <li><a href="viewallcourses" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Courses</a></li>
                <li><a href="regcourses" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Registered Courses by Students</a></li>
            </ul>
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white dark:bg-gray-900 w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome" class="text-2xl font-semibold text-blue-700">Admin Home</a>
                <ul class="flex items-center space-x-4">
                    <li><a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a></li>
                </ul>
            </div>
        </nav>
        
        
        <!-- Form Section -->
        <div class="pt-24 flex-grow flex items-start justify-center mt-16 px-4">
            <div id="login-card" class="w-full max-w-lg bg-yellow-100 rounded-lg shadow-lg p-8 space-y-6 transition-all duration-500">
                <h3 class="text-center text-2xl font-semibold text-gray-700 underline">Add Courses</h3>

                <form action="insertcourse" method="post"  class="space-y-4">
                    <div>
					    <label for="cname" class="block text-black font-bold text-xl">Enter Course Name</label>
					    <input type="text" name="cname" placeholder="Enter Course Name" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"/>
					</div>
					 <div>
					    <label for="cdetails" class="block text-black font-bold text-xl">Enter Course Details</label>
					    <textarea name="cdetails" rows="4" placeholder="Enter Course Details" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
					</div>
                    <div>
                        <label for="cduration" class="block text-black font-bold text-xl">Enter Course Duration</label>
                        <input type="text" name="cduration" placeholder="Enter Course Duration" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
                    </div>
                    <div>
					    <label for="celigibility" class="block text-black font-bold text-xl">Enter Course Eligibility</label>
					    <textarea name="celigibility" rows="4" placeholder="Enter Course Eligibility" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
					</div>
                   <div class="flex flex-col sm:flex-row sm:justify-between items-center gap-4">
                        <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-md focus:outline-none w-full sm:w-auto">Add</button>
                        <input type="reset" value="Clear" class="bg-red-500 hover:bg-red-600 text-white font-semibold py-2 px-4 rounded-md focus:outline-none w-full sm:w-auto" />
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const sidebar = document.getElementById("sidebar");
        const toggleSidebar = document.getElementById("toggle-sidebar");

        toggleSidebar.addEventListener("click", () => {
            sidebar.classList.toggle("hidden");
        });
    </script>
</body>

</html>
