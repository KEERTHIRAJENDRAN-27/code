update this code if i click update means update the doctor details
<body>
  <div class="container">
    <div class="form-box">
      <h2>Doctor Schedule Form</h2>
      <form #saveDoctor="ngForm" (ngSubmit)="save(saveDoctor)">
        <label for="doctorName">Doctor Name</label>
        <input type="text" id="doctorName" name="doctorName" ngModel required>

        <label for="specialization">Specialization</label>
        <input type="text" id="specialization" name="specialization" ngModel required>

        <label for="gender">Gender</label>
        <select id="gender" name="gender" ngModel required>
          <option value="">Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>

        <label>Available Days</label>
        <div class="checkbox-group">
          <label><input type="checkbox" name="availableDays" ngModel (change)="updateDays($event)" value="Monday"> Monday</label>
          <label><input type="checkbox" name="availableDays" ngModel (change)="updateDays($event)" value="Tuesday"> Tuesday</label>
          <label><input type="checkbox" name="availableDays" ngModel (change)="updateDays($event)" value="Wednesday"> Wednesday</label>
          <label><input type="checkbox" name="availableDays" ngModel (change)="updateDays($event)" value="Thursday"> Thursday</label>
          <label><input type="checkbox" name="availableDays" ngModel (change)="updateDays($event)" value="Friday"> Friday</label>
          <label><input type="checkbox" name="availableDays" ngModel (change)="updateDays($event)" value="Saturday"> Saturday</label>
          <label><input type="checkbox" name="availableDays" ngModel (change)="updateDays($event)" value="Sunday"> Sunday</label>
        </div>

        <label>Available Times</label>
        <div class="checkbox-group">
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="08:00"> 08:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="08:30"> 08:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="09:00"> 09:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="09:30"> 09:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="10:00"> 10:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="10:30"> 10:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="11:00"> 11:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="11:30"> 11:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="12:00"> 12:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="12:30"> 12:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="14:00"> 14:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="14:30"> 14:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="15:00"> 15:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="15:30"> 15:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="16:00"> 16:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="16:30"> 16:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="17:00"> 17:00</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="17:30"> 17:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="18:30"> 18:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="19:30"> 19:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="20:30"> 20:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="21:30"> 21:30</label>
          <label><input type="checkbox" name="availableTime" ngModel (change)="updateTimes($event)" value="22:00"> 22:00</label>
          
        </div>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" ngModel required>

        <label for="contact">Contact Number</label>
        <input type="text" id="contact" name="contact" ngModel required>

        <label for="experience">Experience (Years)</label>
        <input type="number" id="experience" name="experience" ngModel min="0" required>

        <button type="submit">update</button>
<button type="submit">delete</button>
      </form>
    </div>
  </div>
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
  private paths1 = "http://localhost:8012/doctor/update/{doctorId}";
  private paths2 = "http://localhost:8012/doctor/delete/{doctorId}";
  private paths3 = "http://localhost:8012/doctor/fetch/{doctorId}";
  private paths4 = "http://localhost:8012/doctor/fetchAll";

  constructor(private http: HttpClient) { }

  public save(saveDoc: Doctor): Observable<string> {
    console.log(saveDoc);
    return this.http.post(this.paths, saveDoc, { responseType: 'text' });
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

import { Component } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Doctor, DoctorService } from '../doctor.service';

@Component({
  selector: 'app-doctor-update',
  imports: [RouterLink,FormsModule],
  templateUrl: './doctor-update.component.html',
  styleUrl: './doctor-update.component.css'
})
export class DoctorUpdateComponent {
    
  }
