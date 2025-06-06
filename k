Here is the fully updated and working code for your Doctor update functionality including:

✅ Fixed Doctor model (with default/optional constructor)

✅ Fixed DoctorService (already mostly correct)

✅ Updated doctor-update.component.ts

✅ Clean and functional doctor-update.component.html



---

✅ doctor.model.ts (OR in doctor.service.ts)

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

  constructor(
    doctorId?: number,
    doctorName?: string,
    specialization?: string,
    gender?: string,
    availableDays?: string,
    availableTime?: string,
    email?: string,
    contact?: string,
    experience?: number
  ) {
    this.doctorId = doctorId ?? 0;
    this.doctorName = doctorName ?? '';
    this.specialization = specialization ?? '';
    this.gender = gender ?? '';
    this.availableDays = availableDays ?? '';
    this.availableTime = availableTime ?? '';
    this.email = email ?? '';
    this.contact = contact ?? '';
    this.experience = experience ?? 0;
  }
}


---

✅ doctor.service.ts

Already good, but ensure it's like this:

import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Doctor } from './doctor.model'; // or inline if no separate file

@Injectable({
  providedIn: 'root'
})
export class DoctorService {
  private paths = "http://localhost:8012/doctor/add";
  private baseUrl = "http://localhost:8012/doctor";

  constructor(private http: HttpClient) { }

  public save(saveDoc: Doctor): Observable<string> {
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


---

✅ doctor-update.component.ts

import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DoctorService } from '../doctor.service';
import { Doctor } from '../doctor.model';

@Component({
  selector: 'app-doctor-update',
  templateUrl: './doctor-update.component.html',
  styleUrls: ['./doctor-update.component.css']
})
export class DoctorUpdateComponent implements OnInit {

  doctor: Doctor = new Doctor();
  doctorId!: number;

  constructor(
    private doctorService: DoctorService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.doctorId = Number(this.route.snapshot.paramMap.get('id'));
    this.loadDoctorDetails();
  }

  loadDoctorDetails(): void {
    this.doctorService.fetchById(this.doctorId).subscribe({
      next: (data) => {
        this.doctor = data;
      },
      error: (err) => {
        console.error("Failed to load doctor", err);
      }
    });
  }

  onUpdate(): void {
    this.doctorService.update(this.doctor.doctorId, this.doctor).subscribe({
      next: (response) => {
        alert('Doctor details updated successfully!');
        this.router.navigate(['/doctorProfile']); // or wherever you want
      },
      error: (err) => {
        console.error("Update failed", err);
        alert("Update failed. Check console for error.");
      }
    });
  }
}


---

✅ doctor-update.component.html

<div class="update-form">
  <h2>Update Doctor Details</h2>

  <form (ngSubmit)="onUpdate()">
    <label>Doctor Name:</label>
    <input type="text" [(ngModel)]="doctor.doctorName" name="doctorName" required>

    <label>Specialization:</label>
    <input type="text" [(ngModel)]="doctor.specialization" name="specialization" required>

    <label>Gender:</label>
    <input type="text" [(ngModel)]="doctor.gender" name="gender" required>

    <label>Available Days:</label>
    <input type="text" [(ngModel)]="doctor.availableDays" name="availableDays" required>

    <label>Available Time:</label>
    <input type="text" [(ngModel)]="doctor.availableTime" name="availableTime" required>

    <label>Email:</label>
    <input type="email" [(ngModel)]="doctor.email" name="email" required>

    <label>Contact:</label>
    <input type="text" [(ngModel)]="doctor.contact" name="contact" required>

    <label>Experience (years):</label>
    <input type="number" [(ngModel)]="doctor.experience" name="experience" required>

    <button type="submit">Update Doctor</button>
  </form>
</div>


---

✅ Optional Styling (doctor-update.component.css)

.update-form {
  max-width: 600px;
  margin: 30px auto;
  background-color: #f4f7f8;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.1);
}

.update-form h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #333;
}

.update-form label {
  display: block;
  margin: 10px 0 5px;
}

.update-form input {
  width: 100%;
  padding: 8px;
  margin-bottom: 12px;
  border: 1px solid #ccc;
  border-radius: 6px;
}

.update-form button {
  background-color: #1d3557;
  color: white;
  border: none;
  padding: 10px 20px;
  width: 100%;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
}

.update-form button:hover {
  background-color: #457b9d;
}


---

Let me know if you want the router setup or a version with dropdowns for specialization/time.

