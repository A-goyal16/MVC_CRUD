<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@include file="Component/studentformcss.jsp"%>
</style>
</head>
<body>
    <div class="heading">
        <h1>Add the Details Here</h1>
    </div>
      <div id="imageContainer"></div>
    <div id="formContainer">
        <form action="save" method="post" modelAttribute="studentdata" onsubmit="return validateForm()">
            Enter name: <input type="text" name="name" id="name"><br>
            Enter Section: <input type="text" name="section" id="section"oninput="validateSection(event)"><br>
            Select Gender <br> 
            Male : <input type="radio" name="gender" value="male" class="gender"><br>
            Female : <input type="radio" name="gender" value="female" class="gender"><br>
            <input type="file" id="imageInput" accept="image/*">
            <button type="button" id="uploadBtn">Upload</button>
            <button type="submit" id="submitBtn">Submit</button>
            <button type="button"><a href="home.jsp">Cancel</a></button>
        </form>
    </div>
    <div class="link">
        <a href="home.jsp">Back to Home</a>
    </div>
    <script>
    <%@include file="Component/savescript.jsp"%>
    document.getElementById('uploadBtn').addEventListener('click', function() {
        const fileInput = document.getElementById('imageInput');
        const file = fileInput.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function(e) {
            const image = document.createElement('img');
            image.src = e.target.result;
            document.getElementById('imageContainer').innerHTML = '';
            document.getElementById('imageContainer').appendChild(image);
          }
          reader.readAsDataURL(file);
        } else {
          alert('Please select an image.');
        }
      });
    </script>
</body>
</html>
