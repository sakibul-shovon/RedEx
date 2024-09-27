![94934ea7-1f92-40b0-b9f4-500e2f8c3cac-removebg-preview](https://github.com/user-attachments/assets/1544ee6f-390f-4ee0-a4f7-1d36848d8cc8)

<h1>Project Name : RedEx</h1>

<p>This project is an <strong>Android app</strong> built using <strong>Flutter</strong> and <strong>Firebase</strong>. The app serves as a platform for users to upload PDF files for printing, while offering additional features like <strong>authentication via Google and Facebook</strong>, <strong>chat functionality</strong>, a <strong>newsfeed</strong>, and the ability to <strong>refill balance</strong> to access services.</p>

<h2>Table of Contents</h2>
<ul>
  <li><a href="#features">Features</a></li>
  <li><a href="#tech-stack">Tech Stack</a></li>
  <li><a href="#installation">Installation</a></li>
  <li><a href="#usage">Usage</a></li>
  <li><a href="#screenshots">Screenshots</a></li>
  <li><a href="#contributing">Contributing</a></li>
  <li><a href="#license">License</a></li>
</ul>

<h2 id="features">Features</h2>
<ul>
  <li><strong>Authentication</strong>: Users can sign in or register using Google or Facebook.</li>
  <li><strong>Upload PDFs</strong>: Digitalize your printing process by uploading PDF files for printing.</li>
  <li><strong>Chat</strong>: Communicate with customer support or other users directly through the app.</li>
  <li><strong>Newsfeed</strong>: Stay updated with the latest news related to our printing services.</li>
  <li><strong>Balance Refill</strong>: Users can refill their balance to access the printing and other paid features.</li>
  <li><strong>Firebase Backend</strong>: All data such as files, user information, and chat history is stored and managed in Firebase.</li>
</ul>

<h2 id="tech-stack">Tech Stack</h2>
<ul>
  <li><strong>Flutter</strong>: Frontend framework for building the app's user interface.</li>
  <li><strong>Firebase</strong>: Backend services including Authentication, Firestore, Storage, and Realtime Database.</li>
  <li><strong>Google & Facebook Authentication</strong>: User login and signup.</li>
  <li><strong>Cloud Firestore</strong>: Manages user data and interactions (e.g., chat, newsfeed).</li>
  <li><strong>Firebase Storage</strong>: Stores user-uploaded PDF files.</li>
  <li><strong>Firebase Realtime Database</strong>: Manages real-time updates for chats and newsfeed.</li>
</ul>

<h2 id="installation">Installation</h2>
<p>To run this project locally, follow these steps:</p>

<ol>
  <li><strong>Clone the repository</strong>:
    <pre><code>git clone https://github.com/sakibul-shovon/RedEx.git</code></pre>
  </li>
  <li><strong>Navigate to the project directory</strong>:
    <pre><code>cd your-repo-name</code></pre>
  </li>
  <li><strong>Install dependencies</strong>:
    <pre><code>flutter pub get</code></pre>
  </li>
  <li><strong>Set up Firebase</strong>:
    <ul>
      <li>Go to <a href="https://console.firebase.google.com/">Firebase Console</a>.</li>
      <li>Create a Firebase project and add an Android app.</li>
      <li>Download the <code>google-services.json</code> file and place it in the <code>android/app</code> directory.</li>
      <li>Enable Firebase Authentication, Firestore, Storage, and Realtime Database in the Firebase Console.</li>
      <li>Add Facebook and Google Sign-In configurations if needed.</li>
    </ul>
  </li>
  <li><strong>Run the app</strong>:
    <pre><code>flutter run</code></pre>
  </li>
</ol>

<h2 id="usage">Usage</h2>
<ul>
  <li><strong>Sign In</strong>: Users can sign in via Google or Facebook accounts.</li>
  <li><strong>Upload PDF</strong>: Users can upload PDF files to the platform for printing.</li>
  <li><strong>Chat</strong>: Interact with support or others through the in-app chat.</li>
  <li><strong>Newsfeed</strong>: View and stay updated with the latest news.</li>
  <li><strong>Balance Refill</strong>: Users can refill their balance to pay for printing services.</li>
</ul>

<h2 id="screenshots">Screenshots</h2>
<p>Include some screenshots of the app for better visualization:</p>
<ul>
  
<li>![image](https://github.com/user-attachments/assets/48ed5a01-dcc0-4008-b9b4-bbcbf3a64610) </li>

  <li>![image](https://github.com/user-attachments/assets/ebce0978-27d0-42e0-9db5-046804fa8ced)
</li>
  <li>![image](https://github.com/user-attachments/assets/0aaa54ce-dea9-4f87-b74f-ee4a4fea8d8b)
</li>
  <li>![image](https://github.com/user-attachments/assets/41b9efef-f686-44a9-a8c0-0e7f5c5b8e3d)
</li>
<li>![image](https://github.com/user-attachments/assets/22d43ce1-5498-4ad8-abde-b740eea702c4)
</li>
  
</ul>

<h2 id="contributing">Contributing</h2>
<p>Contributions are welcome! To contribute:</p>
<ol>
  <li>Fork the repository.</li>
  <li>Create a new branch (<code>git checkout -b feature-branch</code>).</li>
  <li>Make your changes.</li>
  <li>Push to the branch (<code>git push origin feature-branch</code>).</li>
  <li>Open a pull request.</li>
</ol>

<h2 id="license">License</h2>
<p>This project is licensed under the MIT License. See the <a href="LICENSE">LICENSE</a> file for more details.</p>
