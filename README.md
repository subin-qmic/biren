Student Tracking Application for Tutorial Centers

This application was started in April 2023 with Flutter.

Clone the Project
bash
Copy code
  git clone https://github.com/Hazret-Apps/biren.git
With this application, a teacher or administrator logging in as admin (Admin Application) can for a student:

<img src="/screenshots/admin_home_view.png" width=35%>
Create Homework,
Create Announcements,
Take Attendance,
Enter exam results
Homework Creation Algorithm
When creating homework, the teacher enters a date, the student, the subject, and the topic. The selected student sees their homework on the calendar on their homepage and in the homework section. When completed, they mark the "completed" option and take a photo of their homework. The teacher then sees the student's homework among the received homework and marks it as "done, not done, or incomplete".

<img src="/screenshots/create_homework_view.png" width=35%>
Announcement Creation Algorithm
The teacher can send announcements to a certain group of students or everyone, along with a photo or PDF.

<img src="/screenshots/create_announcement_view.png" width=35%>
Packages

easy_localization (For app language support)
firebase_core (+ other basic Firebase packages)
kartal (Context extension)
image_picker
