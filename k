update this code if i click update means update the patient details
<body>
    <div class="container">
      <h1>Update your Profile</h1>
      <form #updatePatient="ngForm" (ngSubmit)="update(updatePatient)">
        <label for="name">Name:</label>
        <input type="text" id="name" placeholder="Enter your name" ngModel name="name" required />
   
        <label for="age">Age:</label>
        <input type="number" id="age" placeholder="Enter your age"  ngModel name="age" required />
   
        <label for="bloodGroup">Blood Group:</label>
        <input type="text" id="bloodGroup" placeholder="e.g. A+, B-, O+" ngModel name="bloodGroup" required />
   
        <label for="gender" >Gender:</label>
        <select id="gender" ngModel name="gender" required>
          <option value="">Select gender</option>
          <option>Male</option>
          <option>Female</option>
          <option>Other</option>
        </select>
   
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" value="1988-12-27" ngModel name="dateOfBirth"  required />
   
        <label for="medicalHistory">Medical History:</label>
        <textarea id="medicalHistory" rows="4" placeholder="Enter any relevant history" ngModel name="medicalHistory" ></textarea>
   
        <label for="email">Email:</label>
        <input type="email" id="email" placeholder="Enter your email" ngModel name="email"  required />
   
        <label for="contactDetails">Contact Details:</label>
        <input type="text" id="contactDetails" placeholder="Phone number or address" ngModel name="contactDetails" required />
   
        <div class="buttons">
          <button type="submit">Update Details</button>
          <button type="reset" class="delete-btn">Delete Profile</button>
        </div>
      </form>
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

  public delete(deletePat:CPatient):Observable<string>{
    console.log(deletePat)
    return this.client.delete(this.paths2,deletePat,{responseType:'text'})
  }

  public fetchById(fetchByIdPat:number):Observable<string>{
    console.log(fetchByIdPat)
    return this.client.get(this.paths3+"/"+fetchByIdPat,{responseType:'text'})
  }

  public fetchAll():Observable<Patient[]>{
    console.log()
    return this.client.get<Patient[]>(this.paths4);
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
--------------------------------------
component code

import { Component } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { PatientService } from '../patient.service';

@Component({
  selector: 'patientUpdate',
  imports: [RouterLink, FormsModule],
  templateUrl: './patient-update.component.html',
  styleUrl: './patient-update.component.css'
})
export class PatientUpdateComponent {
  constructor(private patientService: PatientService, private router: Router) { }
  update(form: NgForm) {
    this.patientService.update(form.value).subscribe(response => console.log(response))
    alert("Patient Updated Succesfully")
    this.router.navigate(['patient'])
  }
  delete(form: NgForm) {
    this.patientService.delete(form.value).subscribe(response => console.log(response))
    alert("Patient Deleted Succesfully")
    this.router.navigate(['patient'])
  }
}
