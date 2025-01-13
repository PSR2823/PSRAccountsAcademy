<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
 
    <script>
        function validateForm() {
            const emailValid = validateEmail();
            const mobileValid = validateMobile();
            const passwordValid = validatePassword();

            if (!emailValid || !mobileValid || !passwordValid) {
                return false; // Prevent form submission if any field is invalid
            }

            return true;
        }
        


        function validateEmail() {
            const emailInput = document.getElementById('semail');
            const email = emailInput.value;
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const emailError = document.getElementById('emailError');

            if (!regex.test(email)) {
                emailError.innerText = 'Invalid email format.';
                emailInput.classList.add('border-red-500');
                return false;
            } else {
                emailError.innerText = '';
                emailInput.classList.remove('border-red-500');
                return true;
            }
        }

        function validateMobile() {
            const mobileInput = document.getElementById('smobileno');
            const mobile = mobileInput.value;
            const regex = /^\d{10}$/;
            const mobileError = document.getElementById('mobileError');

            if (!regex.test(mobile)) {
                mobileError.innerText = 'Mobile number must be 10 digits.';
                mobileInput.classList.add('border-red-500');
                return false;
            } else {
                mobileError.innerText = '';
                mobileInput.classList.remove('border-red-500');
                return true;
            }
        }

        function validatePassword() {
            const passwordInput = document.getElementById('spwd');
            const password = passwordInput.value;
            const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{6,}$/;
            const passwordError = document.getElementById('passwordError');

            if (!regex.test(password)) {
                passwordError.innerText = 'Password must be at least 6 characters long, including an uppercase letter, a lowercase letter, a number, and a special character.';
                passwordInput.classList.add('border-red-500');
                return false;
            } else {
                passwordError.innerText = '';
                passwordInput.classList.remove('border-red-500');
                return true;
            }
        }

        function showOtherInput() {
            const select = document.getElementById('squalification');
            const otherInput = document.getElementById('otherQualification');
            if (select.value === 'Others') {
                otherInput.classList.remove('hidden');
                otherInput.setAttribute('required', 'required');
            } else {
                otherInput.classList.add('hidden');
                otherInput.removeAttribute('required');
            }
        }

        function dismissAlert() {
            document.body.querySelector('.fixed').remove();
        }
    </script>
</head>
<body class="bg-white text-gray-800">

    <!-- Marquee Section for announcements -->
    <marquee 
        style="font-family: Georgia, Times New Roman, Times, serif; font-size: 1.25rem; padding: 10px; color: white;" 
        bgcolor="brown"
    >
        <b class="font-bold text-xl">Classes will begin soon</b>
    </marquee>

    <!-- Navbar Section -->
    <div class="w-full bg-white text-black shadow-lg">
        <div class="container mx-auto flex items-center justify-between py-4">
            <a href="main.jsp" class="flex items-center">
                <img 
                    src="psr.png" 
                    alt="PSR Academy Logo" 
                    class="w-20 h-18 object-cover rounded-lg shadow-lg"
                >
            </a>

            <div class="flex items-center space-x-6">
                <a href="main.jsp" class="font-bold hover:text-red-600">Home</a>
                <a href="courses" class="font-bold hover:text-red-600">Courses</a>
                <a href="contactus" class="font-bold hover:text-red-600">Contact Us</a>
                <a href="aboutus" class="font-bold hover:text-red-600">About</a>
                <div class="flex items-center">
                    <i class="fas fa-user-circle w-6 h-6 text-black mr-1"></i>
                    <a href="studentlogin" class="font-bold hover:text-red-600">Login</a>
                </div>
            </div>
        </div>
    </div>


<!-- Registration Form -->
<div class="max-w-2xl mx-auto mt-8 bg-blue-200 p-6 rounded-lg shadow-lg">
    <h3 class="text-center text-2xl font-semibold text-gray-800 mb-6">Student Registration</h3>
    
    <!-- Display error or success message -->
    <c:if test="${not empty message}">
        <div class="alert alert-danger text-center bg-yellow-200 text-red-400 text-xl font-bold p-4 rounded-lg">
            ${message}
        </div>
    </c:if><br>
  
    <form method="post" action="insertstudent" onsubmit="return validateForm()">
        <div class="mb-4">
            <label for="sname" class="block text-lg font-semibold text-gray-800">Full Name</label>
            <input type="text" id="sname" name="sname" placeholder="Enter your full name" class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
        </div>

        <div class="mb-4">
            <label class="block text-lg font-semibold text-gray-800">Gender</label>
            <div class="flex flex-wrap space-x-4 mt-2 custom-radio">
                <label>
                    <input type="radio" id="male" name="sgender" value="MALE" required />
                    <span>Male</span>
                </label>
                <label>
                    <input type="radio" id="female" name="sgender" value="FEMALE" required />
                    <span>Female</span>
                </label>
            </div>
        </div>

        <div class="mb-4">
            <label for="sdob" class="block text-lg font-semibold text-gray-800">Date of Birth</label>
            <input type="date" id="sdob" name="sdob" class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
        </div>

        <div class="mb-4">
            <label class="block text-lg font-semibold text-gray-800">Qualification</label>
            <select name="squalification" id="squalification" class="mt-2 w-full bg-gray-100 border border-gray-300 rounded p-2" onchange="showOtherInput()" required>
                <option value="Select">---Select---</option>
                <option value="Inter">Inter</option>
                 <option value="B.com">B.com</option>
                 <option value="M.com">M.com</option>
                  <option value="MBA">MBA</option>
                <option value="Others">Others</option>
            </select>
            <input type="text" id="otherQualification" name="otherQualification" class="mt-2 w-full bg-gray-100 border border-gray-300 rounded p-2 hidden" placeholder="Enter your qualification" />
        </div>

        <div class="mb-4">
            <label class="block text-lg font-semibold text-gray-800">Experience</label>
            <select name="sexperience" id="sexperience" class="mt-2 w-full bg-gray-100 border border-gray-300 rounded p-2" required>
                <option value="Select">---Select---</option>
                <option value="Fresher">Fresher</option>
                <option value="1 year">1 year</option>
                <option value="More than 1 year">More than 1 year</option>
            </select>
        </div>

        <div class="mb-4">
            <label for="splace" class="block text-lg font-semibold text-gray-800">Address</label>
            <input type="text" id="splace" name="splace" placeholder="Enter your current address" class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
        </div>

        <div class="mb-4">
            <label for="smobileno" class="block text-lg font-semibold text-gray-800">Mobile Number</label>
            <input type="text" id="smobileno" name="smobileno" placeholder="Enter a valid 10-digit mobile number" pattern="\d{10}" class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" onblur="validateMobile()" required />
            <small id="mobileError" class="text-red-600 font-bold block mt-1"></small>
        </div>

        <div class="mb-4">
            <label for="semail" class="block text-lg font-semibold text-gray-800">Email</label>
            <input type="email" id="semail" name="semail" placeholder="Enter your valid email address" class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" onblur="validateEmail()" required />
            <small id="emailError" class="text-red-600 font-bold block mt-1"></small>
        </div>

        <div class="mb-4">
    <label for="spwd" class="block text-lg font-semibold text-gray-800">Password</label>
    <div class="relative">
        <input 
            type="password" 
            id="spwd" 
            name="spwd" 
            placeholder="Create your own password" 
            class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500 pr-10" 
            oninput="validatePassword()" 
            required 
        />
        <div class="absolute right-4 top-1/2 transform -translate-y-1/2">
            <i id="eyeIcon" class="fas fa-eye text-gray-500 cursor-pointer"></i>
        </div>
       
          
       
    </div>
    <small id="passwordError" class="text-red-600 font-bold block mt-1"></small>
</div>

<script>
    document.getElementById('eyeIcon').addEventListener('click', togglePasswordVisibility);

    function togglePasswordVisibility() {
        const passwordField = document.getElementById('spwd');
        const eyeIcon = document.getElementById('eyeIcon');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            eyeIcon.classList.remove('fa-eye'); // Remove eye icon
            eyeIcon.classList.add('fa-eye-slash'); // Show eye-slash icon
        } else {
            passwordField.type = 'password';
            eyeIcon.classList.remove('fa-eye-slash'); // Remove eye-slash icon
            eyeIcon.classList.add('fa-eye'); // Show eye icon
        }
    }
</script>


        <div class="flex justify-center space-x-4 mt-6">
            <button type="submit" class="px-6 py-2 bg-blue-500 text-white font-semibold rounded-lg hover:bg-blue-600 focus:ring-2 focus:ring-indigo-500">
                Register
            </button>
            <input type="reset" value="Clear" class="px-6 py-2 bg-red-500 text-white font-semibold rounded-lg hover:bg-red-600 focus:ring-2 focus:ring-red-500" />
        </div>
    </form>
</div>

</body>
</html>
