every thing is working but its give all details show change that into
if serach patient means give one card or profile section in that
new patient means give empty doctors can update that info of medical histoy

in that url they can view
http://localhost:8004/medicalHistory/patienthistory/{patientId}
{
    "patient": {
        "patientId": 5,
        "name": "ram",
        "age": 27,
        "bloodGroup": "O+",
        "gender": "Male",
        "dateOfBirth": "2008-11-11",
        "medicalHistory": "None",
        "contactDetails": "9123789589",
        "id": null
    },
    "medicalHistory": [
        {
            "historyId": 4,
            "patientId": 5,
            "diagnosis": "Hypertension",
            "treatment": "Medication",
            "dateOfVisit": "2025-05-14"
        }
    ]
}

<app-header></app-header>

<div class="container">
  <h2>View Medical History</h2>

  <div class="search-section">
    <input type="text" id="patientId" placeholder="Enter Patient ID" #patientInput />
    <button (click)="loadHistory(patientInput.value)">Search</button>
    <button (click)="loadAllHistories()">View All Records</button>
  </div>

  <div *ngIf="medicalHistory">
    <h3>Medical History for Patient {{ medicalHistory.patientId }} 
      <!-- - {{ medicalHistory.diagnosis }} - {{ medicalHistory.treatment }} - {{ medicalHistory.dateOfVisit }} -->
    </h3>
    <ul>
      <li *ngFor="let record of medicalHistory">
        {{ record.treatment }} - {{ record.diagnosis }}
      </li>
    </ul>
  </div>

  <div *ngIf="allMedicalHistories && allMedicalHistories.length > 0">
    <h3>All Medical Histories</h3>
    <ul>
      <li *ngFor="let patient of allMedicalHistories">
        Patient ID: {{ patient.patientId }} -{{ patient.diagnosis }} - {{ patient.treatment }} - {{ patient.dateOfVisit }}</li>
    </ul>
  </div>

  <div *ngIf="allMedicalHistories && allMedicalHistories.length === 0">
    <p>No medical history records found.</p>
  </div>
</div>
-------------------------------------------------------------------------------------
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MedicalHService } from '../medical-h.service';
import { HeaderComponent } from '../header/header.component';

@Component({
  selector: 'app-doctor-vrecords',
  standalone: true,  
  imports: [RouterLink,HeaderComponent,CommonModule], 
  templateUrl: './doctor-vrecords.component.html',
  styleUrls: ['./doctor-vrecords.component.css']
})
export class DoctorVRecordsComponent {
  medicalHistory: any;
  allMedicalHistories: any;

  constructor(private medicalService: MedicalHService) {}

  loadHistory(patientId: string): void {
    this.medicalHistory = undefined;  // Reset previous data
    const idAsNumber = Number(patientId);
    if (!isNaN(idAsNumber) && idAsNumber > 0) {
      this.medicalService.getMedicalHistory(idAsNumber).subscribe({
        // next: (data) => {
        //   console.log('Fetched patient history:', data);
        //   this.medicalHistory = data;
        // },
        next: (data) => {
          console.log('API Response:', data);
          this.medicalHistory = data;
        },        
        error: (err) => {
          console.error('Error fetching records:', err);
        }
      });
    } else {
      console.error('Invalid Patient ID');
    }
  }
  

  //  Load all medical histories
  loadAllHistories(): void {
    this.medicalService.getAllMedicalHistories().subscribe({
      next: (data) => {
        this.allMedicalHistories = data;
        console.log('Fetched all records:', data);
      },
      error: (err) => {
        console.error('Error fetching all records:', err);
      }
    });
  }
}
------------------------------------------------------------------------------

in this code dont change add this url

http://localhost:8004/medicalHistory/patienthistory/{patientId}
for viewing 
 
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MedicalHService {
  private baseUrl = 'http://localhost:8004/medicalHistory'; 

  constructor(private http: HttpClient) {}

  //  Fetch medical history by patient ID
  getMedicalHistory(patientId: number): Observable<any> {
    console.log(`Fetching history for patient ID: ${patientId}`);
    return this.http.get(`${this.baseUrl}/patient/${patientId}`);
  }

  //  Fetch all medical records
  getAllMedicalHistories(): Observable<any> {
    console.log('Fetching all medical histories...');
    return this.http.get(`${this.baseUrl}/all`);
  }
}
