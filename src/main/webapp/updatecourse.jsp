<%@ page import="com.klef.jfsd.springboot.model.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<%
    Course course = (Course) request.getAttribute("course");
    if(course == null) {
        response.sendRedirect("errorpage");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Course</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-300">
    <!-- Centered Update Form -->
    <div class="flex items-center justify-center min-h-screen">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
            <h2 class="text-2xl font-semibold text-gray-800 text-center mb-6">Update Course Details</h2>
            <form action="updatecourseprofile" method="post" class="space-y-4">
                <!-- Course ID (hidden) -->
                <div>
                    <label for="cid" class="block text-sm font-medium text-gray-700">Course ID</label>
                    <input type="number" id="cid" name="cid" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" value="<c:out value='${course.id}'/>" readonly required>
                </div>
                <!-- Course Name -->
                <div>
                    <label for="cname" class="block text-sm font-medium text-gray-700">Course Name</label>
                    <input type="text" id="cname" name="cname" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" value="<c:out value='${course.name}'/>" required>
                </div>
                <!-- Course Details -->
                <div>
                    <label for="cdetails" class="block text-sm font-medium text-gray-700">Course Details</label>
                    <textarea id="cdetails" name="cdetails" rows="4" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" required><c:out value='${course.details}'/></textarea>

                </div>
                <!-- Course Duration -->
                <div>
                    <label for="courseDuration" class="block text-sm font-medium text-gray-700">Course Duration</label>
                    <input type="text" id="courseDuration" name="courseDuration" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" value="<c:out value='${course.duration}'/>" required>
                </div>
                <!-- Course Eligibility -->
                <div>
                    <label for="courseEligibility" class="block text-sm font-medium text-gray-700">Eligibility</label>
                    <textarea id="courseEligibility" name="courseEligibility" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"><c:out value='${course.eligibility}'/></textarea>
                </div>
                <!-- Submit Button -->
                <div>
                    <button type="submit" class="w-full bg-blue-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">Update Course</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
