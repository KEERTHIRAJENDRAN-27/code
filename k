update this code 
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
