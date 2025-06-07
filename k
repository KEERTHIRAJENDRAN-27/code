this is my working appointment booking code but i need some updates
dont give doctor id patient id for booking appoinment other wise fetch dotor name and specialization show that [not editable formate]
below available time details dont show booked time  
dont give option like schedule resecdule cancel 
1st bookappoinment means give scedules and they update the appointment means change status into reschedule if they delete means give status cancelled

but in url iupdate and delte is done by using appointment id in database in backend also
http://localhost:8002/appointment/update/{id}
http://localhost:8002/appointment/delete/{id}
http://localhost:8002/appointment/fetchByDoctorId/{doctorId}

in backend i gave details for update so that u give details for frontend 
{
  "patientId": 24,
  "doctorId": 23,
  "appointmentDateTime": "2025-05-19T14:00:00",
  "reason": "Updated Checkup",
  "status": "Rescheduled"
}

<!-- <p>patient-book works!</p> -->
<body>
    <div class="container">
      <div class="form-box">
        <h2>Book an Appointment</h2>
        <form #appointmentForm="ngForm" (ngSubmit)="bookAppointment(appointmentForm)">
          
          <label for="patientId">Patient ID</label>
          <input type="number" id="patientId" name="patientId" ngModel required min="1">
  
          <label for="doctorId">Doctor ID</label>
          <input type="number" id="doctorId" name="doctorId" ngModel required min="1">
  
          <label for="appointmentDateTime">Appointment Date & Time</label>
          <input type="datetime-local" id="appointmentDateTime" name="appointmentDateTime" ngModel required>
  
          <label for="reason">Reason for Appointment</label>
          <input type="text" id="reason" name="reason" ngModel required>
  
          <label for="status">Status</label>
          <select id="status" name="status" ngModel required>
            <option value="Scheduled">Scheduled</option>
            <option value="Rescheduled">Rescheduled</option>
            <option value="Cancelled">Cancelled</option>
          </select>
  
          <button type="submit" [disabled]="appointmentForm.invalid">Book Appointment</button>
        </form>
      </div>
    </div>
  </body>
  ------------------------------------------------------------------------------------------------------------------------
import { Component } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { AppointmentService } from '../appointment.service';

@Component({
  selector: 'app-patient-book',
  imports: [RouterLink,FormsModule],
  templateUrl: './patient-book.component.html',
  styleUrl: './patient-book.component.css'
})
export class PatientBookComponent {
  constructor(private appointmentService: AppointmentService, private router: Router) {}

  bookAppointment(form: NgForm) {
    if (form.valid) {
      const appointmentData = form.value;

      console.log('Sending to backend:', appointmentData);

      this.appointmentService.save(appointmentData).subscribe({next: response => {
          console.log('Appointment booked successfully!');
          console.log('Appointment Response:', response);
        },
       
      });
      
      
    }
  }
}

  ------------------------------------------------------------------------------------------------------------------------
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AppointmentService {
  private apiUrl = "http://localhost:8002/appointment/save"; 

  constructor(private client: HttpClient) { }

  public save(appointmentData: Appointment): Observable<any> {
    console.log('Booking Appointment:', appointmentData);
    return this.client.post<any>(this.apiUrl, { appointment: appointmentData }, { headers: { 'Content-Type': 'application/json' }, responseType: 'text' as 'json' });
  }

}

export class Appointment {
  patientId: number;
  doctorId: number;
  appointmentDateTime: string;
  reason: string;
  status: string;

  constructor(patientId: number, doctorId: number, appointmentDateTime: string, reason: string, status: string) {
    this.patientId = patientId;
    this.doctorId = doctorId;
    this.appointmentDateTime = appointmentDateTime;
    this.reason = reason;
    this.status = status;
  }
}
----------------------------------------------------------------------------------
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DoctorService {
  
  private baseUrl = 'http://localhost:8012/doctor';

  constructor(private http: HttpClient) {}

  public save(doctor: Doctor): Observable<string> {
    return this.http.post(`${this.baseUrl}/add`, doctor, { responseType: 'text' });
  }

  public update(doctor: Doctor): Observable<string> {
    return this.http.put(`${this.baseUrl}/update/${doctor.doctorId}`, doctor, { responseType: 'text' });
  }

  public delete(doctor: Doctor): Observable<string> {
    return this.http.delete(`${this.baseUrl}/delete/${doctor.doctorId}`, { responseType: 'text' });
  }

  public fetchById(doctorId: number): Observable<Doctor> {
    return this.http.get<Doctor>(`${this.baseUrl}/fetch/${doctorId}`);
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

  constructor(
    doctorId: number = 0,
    doctorName: string = '',
    specialization: string = '',
    gender: string = '',
    availableDays: string = '',
    availableTime: string = '',
    email: string = '',
    contact: string = '',
    experience: number = 0
  ) {
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
