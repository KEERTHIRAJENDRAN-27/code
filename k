update this code for showing doctor details in profile section and also if once they register the details show button into update
app-header></app-header>

<body>
  <section class="profile-section" *ngIf="doctor">
    <div class="profile-image">
      <img src="./assets/doctorProfile.png" alt="Doctor Profile">
    </div>
    <div class="profile-details">
      <h2>{{ doctor?.doctorName }}</h2>
      <p><span class="label">ID:</span> {{ doctor?.doctorId }}</p>
      <p><span class="label">Specialty:</span> {{ doctor?.specialization }}</p>
      <p><span class="label">Experience:</span> {{ doctor?.experience }} years</p>
      <p><span class="label">Gender:</span> {{ doctor?.gender }}</p>
      <p><span class="label">Days Available:</span> {{ doctor?.availableDays }}</p>
      <p><span class="label">Consultation Time:</span> {{ doctor?.availableTime }}</p>
      <p><span class="label">Email:</span> {{ doctor?.email }}</p>
      <p><span class="label">Contact:</span> {{ doctor?.contact }}</p>
    </div>
  </section>

  <main class="dashboard">
    <div class="card">
      <h1>📝</h1>
      <h2>Update Profile</h2>
      <button *ngIf="doctor; else registerBtn" routerLink="/doctorProfileUpdate">
        Update Info
      </button>
      <ng-template #registerBtn>
        <button routerLink="/doctorRegister">Register Info</button>
      </ng-template>
    </div>

    <div class="card">
      <h1>📂</h1>
      <h2>View Records</h2>
      <button routerLink="/viewRecords">Patient History</button>
    </div>

    <div class="card">
      <h1>📑</h1>
      <h2>Appointment Details</h2>
      <button routerLink="/patientBooking">View Appointments</button>
    </div>

    <div class="card">
      <h1>🔔</h1>
      <h2>Check Alerts</h2>
      <button routerLink="/doctorN">View Mail</button>
    </div>
  </main>
</body>

--------------------------------------------------
service code 

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DoctorService {
  private paths = "http://localhost:8012/doctor/add";
  private baseUrl = "http://localhost:8012/doctor";

  constructor(private http: HttpClient) { }

  public save(saveDoc: Doctor): Observable<string> {
    console.log(saveDoc);
    return this.http.post(this.paths, saveDoc, { responseType: 'text' });
  }

  public update(doctorId: number, doctor: Doctor): Observable<string> {
    return this.http.put(`${this.baseUrl}/update/${doctorId}`, doctor, { responseType: 'text' });
  }
  
  public delete(doctorId: number): Observable<string> {
    return this.http.delete(`${this.baseUrl}/delete/${doctorId}`, { responseType: 'text' });
  }
  

  public fetchById(doctorId: number): Observable<Doctor> {
    const url = `${this.baseUrl}/fetch/${doctorId}`;
    return this.http.get<Doctor>(url);
  }

  public fetchAll(): Observable<Doctor[]> {
    return this.http.get<Doctor[]>(`${this.baseUrl}/fetchAll`);
  }
}

export class Doctor {
  doctorId: number;
  doctorName: string;
  specialization: string;
  gender: string;
  availableDays: string;
  availableTime: string;
  email: string;
  contact: string;
  experience: number;

  constructor(doctorId: number, doctorName: string, specialization: string, gender: string, availableDays: string,
    availableTime: string, email: string, contact: string, experience: number) {
    this.doctorId = doctorId;
    this.doctorName = doctorName;
    this.specialization = specialization;
    this.gender = gender;
    this.availableDays = availableDays;
    this.availableTime = availableTime;
    this.email = email;
    this.contact = contact;
    this.experience = experience;
  }
}

--------------------------------------
component code

import { Component, OnInit } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { HeaderComponent } from '../header/header.component';
import { Doctor, DoctorService } from '../doctor.service';

@Component({
  selector: 'app-doctor',
  imports: [RouterLink,HeaderComponent],
  templateUrl: './doctor.component.html',
  styleUrl: './doctor.component.css'
})
export class DoctorComponent implements OnInit{
  doctors: Doctor[] = [];
  doctor?: Doctor;

  constructor(private router: Router, private doctorService: DoctorService) {}

  ngOnInit(): void {
    this.loadAllDoctors();
  }

  loadAllDoctors(): void {
    const userIdStr = localStorage.getItem("userId"); // Assuming doctorId is stored as userId
    const userId = userIdStr ? parseInt(userIdStr, 10) : null;

    this.doctorService.fetchAll().subscribe({
      next: (data: Doctor[]) => {
        this.doctors = data;

        if (userId !== null) {
          this.doctor = data.find(d => d.doctorId === userId);
        }

        console.log('Fetched all doctors:', data);
        console.log('Logged in doctor:', this.doctor);
      },
      error: (err) => {
        console.error('Error fetching doctors:', err);
      }
    });
  }
}
------------------------------------
css code 
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: "Poppins", sans-serif;
}

body {
  padding-top: 50px;
  min-height: 100vh;
  color: #140e0e;
  /* background:rgba(202, 202, 202, 0.6); */
  background-image: url('https://t3.ftcdn.net/jpg/03/11/86/42/360_F_311864233_WrzVI9w22XmJF2Hul4YQQCnCyBa5IeUe.jpg'); 
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat; 
  background-attachment: fixed; 
}

.profile-section {
  background-color: rgba(225, 219, 219, 0.92);
  padding: 30px;
  display: flex;
  flex-direction: row-reverse; /* This puts the image on the right */
  align-items: center;
  justify-content: space-between;
  border-radius: 16px;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
  margin: 40px auto;
  width: 85%;
  max-width: 900px;
  flex-wrap: wrap;
  gap: 20px;
}

.profile-image {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 0 0 14px;
}

.profile-image img {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #1d3557;
}


.profile-details {
  font-size: 17px;
  padding: 10px 30px;
  flex: 1;
  min-width: 260px;
  text-align: left;
}

.profile-details h2 {
  font-size: 25px;
  font-weight: bold;
  color: #042046;
  margin-bottom: 20px;
}

.profile-details p {
  font-size: 18px;
  margin-bottom: 15px;
  line-height: 1.5;
}

.label {
  font-weight: bold;
  color: #457b9d;
}

.highlight {
  font-weight: bold;
  color: #e63946;
}

.dashboard {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 60px; /* Reduced spacing */
  padding: 0px; /* Optimized padding */
  max-width: 85%;
  margin: 0 auto;
}

.card {
  background-color:  rgba(225, 219, 219, 0.92);
  border-radius: 10px;
  padding: 25px;
  text-align: center;
  box-shadow: 0 5px 12px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease;
  min-height: auto; /* Optimized height */
  margin-bottom: 10px;
}

.card:hover {
  transform: translateY(-5px);
}

.card h1 {
  font-size: 32px;
  margin-bottom: 5px;
}

.card h2 {
  font-size: 17px;
  color: #1d3557;
  margin-bottom: 10px;
}

.card button {
  background-color: #39647e;
  color: white;
  border: none;
  padding: 8px 16px;
  font-size: 14px;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.card button:hover {
  background-color: #1d3557;
}

/* Responsive Fix */
@media (max-width: 768px) {
  .profile-section {
    flex-direction: column;
    text-align: center;
  }

  .profile-details {
    text-align: center;
  }

  .dashboard {
    grid-template-columns: 1fr;
    width: 90%;
  }
}
