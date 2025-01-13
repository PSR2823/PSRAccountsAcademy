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
    </script>
</head>
<body class="bg-gray-800 text-gray-800">
<nav class="bg-gray-200 p-4 text-gray-800 shadow-lg flex items-center">
    <div class="container mx-auto flex items-center justify-between">
        <a href="main.jsp" class="flex items-center">
            <img 
                src="psr.png" 
                alt="PSR Academy Logo" 
                class="w-20 h-18 object-cover rounded-lg shadow-lg"
                style="object-fit: cover; image-rendering: auto;"
            >
        </a>
    </div>
</nav>
<br><br>
<div class="flex items-center justify-center min-h-[calc(100vh-80px)]"> <!-- Centers the login box -->
    <div class="bg-white p-6 rounded-lg max-w-lg w-full md:w-[500px] shadow-lg flex flex-col items-center justify-center">
        <h2 class="text-2xl font-bold mb-4 text-center text-gray-800">Admin Login</h2>
        <form method="post" action="checkadminlogin" class="space-y-6 w-full">
            <div class="flex flex-col space-y-2">
                <label for="auname" class="block text-sm text-gray-700 font-bold">Enter Username</label>
                <div class="relative">
                    <input 
                        type="text" 
                        id="auname" 
                        name="auname" 
                        required 
                        class="w-full bg-gray-100 text-gray-800 font-semibold p-3 pl-12 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                        placeholder="Your Username"
                    >
                    <div class="absolute left-4 top-1/2 transform -translate-y-1/2">
                        <i class="fas fa-user text-gray-500"></i>
                    </div>
                </div>
            </div>
            <div class="flex flex-col space-y-2">
                <label for="pwd" class="block text-sm text-gray-700 font-bold">Enter Password</label>
                <div class="relative">
                    <input 
                        type="password" 
                        id="pwd" 
                        name="apwd" 
                        required 
                        class="w-full bg-gray-100 text-gray-800 font-semibold p-3 pl-12 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent" 
                        placeholder="Your Password"
                    >
                    <div class="absolute left-4 top-1/2 transform -translate-y-1/2">
                        <i class="fas fa-lock text-gray-500"></i>
                    </div>
                </div>
            </div>
            <div class="flex justify-between items-center mt-4">
                <button 
                    type="submit" 
                    class="bg-gray-700 hover:bg-gray-800 text-white py-2 px-6 rounded transition duration-300 text-sm font-semibold flex items-center space-x-2"
                >
                    <i class="fas fa-sign-in-alt"></i>
                    <span>Sign In</span>
                </button>
                <input 
                    type="reset" 
                    value="Clear" 
                    class="bg-gray-400 hover:bg-gray-500 text-white py-2 px-4 rounded transition duration-300 text-sm font-semibold"
                >
            </div>
        </form>
    </div>
</div>
</body>
</html>
