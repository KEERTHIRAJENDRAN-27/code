update this code show details of patient in profile give working code 
dont change save its working change other for getting details
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PatientService {
  paths="http://localhost:8001/patients/register"
  paths1="http://localhost:8001/patients/update/{patientId}"
  paths2="http://localhost:8001/patients/delete/{patientId}"
  paths3="http://localhost:8001/patients/fetchById/{patientId}"
  paths4="http://localhost:8001/patients/fetchAll"


  constructor(private client:HttpClient) { }

  public save(savePat:Patient):Observable<string>{
    console.log(savePat)
    return this.client.post(this.paths,savePat,{responseType:'text'})
  }

  public update(updatePat:CPatient):Observable<string>{
    console.log(updatePat)
    return this.client.put(this.paths1,updatePat,{responseType:'text'})
  }

  // public delete(deletePat:CPatient):Observable<string>{
  //   console.log(deletePat)
  //   return this.client.delete(this.paths2,deletePat,{responseType:'text'})
  // }

  public fetchById(fetchByIdPat:CPatient):Observable<string>{
    console.log(fetchByIdPat)
    return this.client.get(this.paths3,fetchByIdPat,{responseType:'text'})
  }

  public fetchAll(fetchAllPat:CPatient):Observable<string>{
    console.log(fetchAllPat)
    return this.client.get(this.paths4,fetchAllPat,{responseType:'text'})
  }
    
}


export class Patient{
  patientId:number;
  name:string;
  age:number;
  bloodGroup:string;
  gender:string;
  dateOfBirth:Date;
  medicalHistory:string;
  email:string;
  contactDetails:string;

  constructor(patientId:number , name:string, age:number,bloodGroup:string,gender:string,dateOfBirth:Date,medicalHistory:string,email:string,contactDetails:string){
    this.patientId=patientId
    this.name=name
    this.age=age
    this.bloodGroup=bloodGroup
    this.gender=gender
    this.dateOfBirth=dateOfBirth
    this.medicalHistory=medicalHistory
    this.email=email
    this.contactDetails=contactDetails

  }
}


export class CPatient{
  patientId:number;
  name:string;
  age:number;
  bloodGroup:string;
  gender:string;
  dateOfBirth:Date;
  medicalHistory:string;
  email:string;
  contactDetails:string;

  constructor(name:string, age:number,bloodGroup:string,gender:string,dateOfBirth:Date,medicalHistory:string,email:string,contactDetails:string){
    this.name=name
    this.age=age
    this.bloodGroup=bloodGroup
    this.gender=gender
    this.dateOfBirth=dateOfBirth
    this.medicalHistory=medicalHistory
    this.email=email
    this.contactDetails=contactDetails

  }
}
--------------------------------------------------------
<app-header></app-header>

<body>
  <section class="profile-section">
    <div class="profile-image">
      <img src="./assets/userProfile.png" alt="Patient Profile">
    </div>
    <div class="profile-details">
      <h2>{{ patient.name }}</h2>
      <p><span class="label">Age:</span> {{ patient.age }}</p>
      <p><span class="label">Blood Group:</span> {{ patient.bloodGroup }}</p>
      <p><span class="label">Gender:</span> {{ patient.gender }}</p>
      <p><span class="label">Date of Birth:</span> {{ patient.dateOfBirth }}</p>
      <p><span class="label">Medical History:</span> {{ patient.medicalHistory }}</p>
      <p><span class="label">Email:</span> {{ patient.email }}</p>
      <p><span class="label">Contact:</span> {{ patient.contactDetails }}</p>
    </div>
  </section>

  <main class="dashboard">
    <div class="card">
      <h1>📝</h1>
      <h2>Update Profile</h2>
      <button routerLink="/patientRegister">Edit Info</button>
    </div>

    <div class="card">
      <h1>📆</h1>
      <h2>Book Appointment</h2>
      <button routerLink="/bookAppointment">Book Now</button>
    </div>

    <div class="card">
      <h1>📑</h1>
      <h2>Appointment Details</h2>
      <button routerLink="/patientBooking">View Appointments</button>
    </div>
    
    <div class="card">
      <h1>🔔</h1>
      <h2>Check Alerts</h2>
      <button routerLink="/patientN">See Alerts</button>
    </div>
  </main>
</body>
------------------------------------------------------------------
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-family: "Poppins", sans-serif;
}

body {
  padding-top: 30px;
  min-height: 100vh;
  color: #140e0e;
  background-image: url('https://images.pexels.com/photos/6010792/pexels-photo-6010792.jpeg?cs=srgb&dl=pexels-tima-miroshnichenko-6010792.jpg&fm=jpg'); 
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat; 
  background-attachment: fixed; 
}

.profile-section {
  background-color: rgba(225, 219, 219, 0.92);
  padding: 20px;
  display: flex;
  flex-direction: row-reverse;
  align-items: center;
  justify-content: space-between;
  border-radius: 16px;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
  margin: 40px auto;
  width: 90%;
  max-width: 900px;
  flex-wrap: wrap;
  gap: 20px;
}

.profile-image {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 0 0 auto;
}

.profile-image img {
  width: 180px;
  height: 180px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #1d3557;
}

.profile-details {
  font-size: 17px;
  padding: 5px 30px;
  flex: 1;
  min-width: 260px;
  text-align: left;
}

.profile-details h2 {
  font-size: 25px;
  font-weight: bold;
  color: #042046;
  margin-bottom: 5px;
}

.profile-details p {
  font-size: 18px;
  margin-bottom: 10px;
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
  gap: 40px;
  padding: 20px;
  max-width: 90%;
  margin: 0 auto;
}

.card {
  background-color: rgba(225, 219, 219, 0.92);
  border-radius: 10px;
  padding: 25px;
  text-align: center;
  box-shadow: 0 5px 12px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease;
}

.card:hover {
  transform: translateY(-5px);
}

.card h1 {
  font-size: 28px;
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

/* Responsive Fixes */
@media (max-width: 768px) {
  .profile-section {
    flex-direction: column;
    text-align: center;
  }

  .profile-details {
    text-align: center;
    padding: 10px;
  }

  .dashboard {
    grid-template-columns: 1fr;
    width: 95%;
  }

  .profile-image img {
    width: 150px;
    height: 150px;
  }
}

@media (max-width: 480px) {
  .card h1 {
    font-size: 24px;
  }

  .card h2 {
    font-size: 15px;
  }

  .card button {
    font-size: 13px;
    padding: 6px 12px;
  }
}
--------------------------------------------------------
import { Component, OnInit } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { HeaderComponent } from '../header/header.component';
import { NgFor, NgIf } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Patient, PatientService } from '../patient.service';

@Component({
  selector: 'app-patient',
  imports: [RouterLink,HeaderComponent,NgIf,FormsModule,NgFor],
  templateUrl: './patient.component.html',
  styleUrl: './patient.component.css'
})

export class PatientComponent implements OnInit {
  patients: Patient[] = [];
  patient?: Patient; // single patient to display

  constructor(private router: Router, private patientService: PatientService) {}

  ngOnInit(): void {
    this.loadAllPatients();
  }

  loadAllPatients(): void {
    this.patientService.fetchAll().subscribe({
      next: (data: Patient[]) => {
        this.patients = data;
        this.patient = data[0]; // display the first patient
        console.log('Fetched all patients:', data);
      },
      error: (err) => {
        console.error('Error fetching patients:', err);
      }
    });
  }

  navigateTo(route: string): void {
    this.router.navigate([route]);
  }
}
