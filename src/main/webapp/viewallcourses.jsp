<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.model.Admin" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("adminsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Courses</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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

        <!-- Page Content -->
        <div class="p-6 mt-16">
            <!-- Page Title Section -->
            <div class="mb-8 p-2 bg-white rounded-lg shadow-md max-w-screen-md mx-auto">
                <h1 class="text-xl font-bold text-red-700 text-center">View All Courses</h1>
            </div>

            <!-- Table Format -->
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white rounded-lg shadow-md border-collapse border border-gray-300">
                    <thead class="bg-gray-700 text-white">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">ID</th>
                            <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Course Name</th>
                            <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Syllabus</th>
                            <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Duration</th>
                            <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Eligibility</th>
                            <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${clist}" var="course" varStatus="status">
                            <tr class="${status.index % 2 == 0 ? 'bg-yellow-100' : 'bg-gray-100'} border border-gray-300">
                                <td class="px-6 py-4 border border-gray-400 bg-white"><c:out value="${course.id}"/></td>
                                <td class="px-6 py-4 border border-gray-400 bg-white">
                                    <p class="text-center font-bold text-black"><c:out value="${course.name}" /></p>
                                </td>
                               <td class="px-6 py-4 border border-gray-400 bg-white">
								    <!-- Store syllabus in a data attribute -->
								   <button 
									    onclick="openModal(this)" 
									    data-syllabus="<c:out value='${course.details}' escapeXml='true' />" 
									    class="inline-block bg-green-500 text-white py-1 px-3 rounded-lg hover:bg-green-600">
									    View Syllabus
									</button>
								</td>

                                <td class="px-6 py-4 border border-gray-400 bg-white">
                                    <p class="text-center font-bold text-black"><c:out value="${course.duration}" /></p>
                                </td>
                                <td class="px-6 py-4 border border-gray-400 bg-white">
                                    <ul class="list-disc ml-6">
                                        <c:forEach items="${course.eligibility}" var="eligibility">
                                            <li class="font-bold text-black"><c:out value="${eligibility}"/></li>
                                        </c:forEach>
                                    </ul>
                                </td>
                                <td class="px-6 py-4 border border-gray-400 bg-white">
                                    <div class="flex space-x-2">
                                        <a href='<c:url value="deletecourse?id=${course.id}" />' 
                                           class="inline-block bg-red-500 text-white py-1 px-3 rounded-lg hover:bg-red-500">
                                            <i class="fas fa-trash-alt"></i> 
                                        </a>
                                        <a href='<c:url value="updatecourse?id=${course.id}" />' 
                                           class="inline-block bg-blue-500 text-white py-1 px-3 rounded-lg hover:bg-blue-600">
                                            <i class="fas fa-edit"></i>  
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal HTML -->
    <div id="syllabusModal" class="hidden fixed inset-0 z-50 flex items-center justify-center bg-gray-900 bg-opacity-75">
        <div class="bg-gray-300 rounded-lg shadow-lg w-1/2 p-6">
            <h2 class="text-xl font-bold mb-4">Course Syllabus</h2>
            <p id="syllabusContent" class="text-gray-800"></p>
            <div class="mt-4 flex justify-end">
                <button onclick="closeModal()" class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded-lg">
                    Close
                </button>
            </div>
        </div>
    </div>

    <!-- JavaScript for Modal -->
    <script>
    function openModal(button) {
        const syllabus = button.getAttribute("data-syllabus");
        document.getElementById("syllabusModal").classList.remove("hidden");
        document.getElementById("syllabusContent").innerText = syllabus;
    }

    function closeModal() {
        document.getElementById("syllabusModal").classList.add("hidden");
    }

    </script>
</body>
</html>
