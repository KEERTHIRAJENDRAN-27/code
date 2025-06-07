
X [ERROR] TS2339: Property 'fetchByDoctorId' does not exist on type 'AppointmentService'. [plugin angular-compiler]

    src/app/patient-book/patient-book.component.ts:50:28:
      50 │ ...this.appointmentService.fetchByDoctorId(this.doctorId).subscrib...
         ╵                            ~~~~~~~~~~~~~~~

in that url they can fetch doctor availble days and time only not booked 
http://localhost:8012/doctor/slots/{doctorId}
in that url they can fetch doctor booked availble days and time
http://localhost:8002/appointment/fetchByDoctorId/23

export class AppointmentService {
  private baseUrl = 'http://localhost:8002/appointment';
 
  constructor(private client: HttpClient) {}
 
  save(data: any): Observable<any> {
    return this.client.post(`${this.baseUrl}/save`, { appointment: data }, {
      headers: { 'Content-Type': 'application/json' },
      responseType: 'text' as 'json'
    });
  }
 
  getBookedAppointments(doctorId: number): Observable<any[]> {
    return this.client.get<any[]>(`${this.baseUrl}/fetchByDoctorId/${doctorId}`);
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
----------------------------------------------------------
this is my working doctor service code 
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
