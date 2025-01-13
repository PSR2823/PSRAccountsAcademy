<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) 
{
    response.sendRedirect("adminsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Students</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        body {
            min-height: 100vh;
            background-color: transparent;
        }
    </style>
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


        <!-- Page Content -->
        <div class="p-6 mt-16">
            <!-- Page Title Section -->
            <div class="mb-8 p-2 bg-white rounded-lg shadow-md max-w-screen-md mx-auto">
                <h1 class="text-xl font-bold text-red-700 text-center">View All Students</h1>
            </div>

            <!-- Table Format -->
            <div class="overflow-x-auto">
               <table class="min-w-full bg-white rounded-lg shadow-md border-collapse border border-gray-300">
                    <thead class="bg-gray-700 text-white">
                 <tr>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Student ID</th>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Name</th>
                   <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Gender</th>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">DOB</th>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Qualification</th>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Experience</th>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Contact</th>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Place</th>
                    <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Email</th>
                   <th class="px-6 py-3 text-left text-sm font-medium border border-gray-400">Actions</th>
                 </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${slist}" var="student" varStatus="status">
                            <tr class="${status.index % 2 == 0 ? 'bg-blue-100' : 'bg-gray-100'}">
                                <td class="px-6 py-4 border border-gray-400 bg-white"><c:out value="${student.id}"/></td>
                                
                                <td class="px-6 py-4 border border-gray-400 bg-white">   
                                <p class="text-center font-bold text-black"><c:out value="${student.name}"/></tp>
                                </td>
                                
                               <td class="px-6 py-4 border border-gray-400 bg-white"> 
                                <p class="text-center font-bold text-black"><c:out value="${student.gender}"/></p>
                                </td>
                                
                                <td class="px-6 py-4 border border-gray-400 bg-white"> 
                                <p class="text-center font-bold text-black"><c:out value="${student.dob}"/></p>
                                </td>
                                
                                <td class="px-6 py-4 border border-gray-400 bg-white"> 
                                <p class="text-center font-bold text-black"><c:out value="${student.qualification}"/></p>
                                </td>
                                
                                <td class="px-6 py-4 border border-gray-400 bg-white"> 
                                <p class="text-center font-bold text-black"><c:out value="${student.experience}"/></p>
                                </td>
                                
                               <td class="px-6 py-4 border border-gray-400 bg-white"> 
                                <p class="text-center font-bold text-black"><c:out value="${student.mobileno}"/></p>
                                </td>
                                
                                <td class="px-6 py-4 border border-gray-400 bg-white"> 
                                <p class="text-center font-bold text-black"><c:out value="${student.address}"/></p>
                                </td>
                                
                                 <td class="px-6 py-4 border border-gray-400 bg-white"> 
                                <p class="text-center font-bold text-black"><c:out value="${student.email}"/></p>
                                </td>
                                
                                <td class="px-6 py-4 bg-white">
                                    <a href='<c:url value="deletestudent?id=${student.id}"></c:url>' 
                                       class="inline-block bg-red-500 text-white py-1 px-3 rounded-lg hover:bg-red-600">
                                        <i class="fas fa-trash-alt"></i> 
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
