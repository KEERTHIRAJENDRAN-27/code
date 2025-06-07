wait i gave my ts code also update html css ts 
this is the working delete html code but that error shown for 

scheduleTask @ zone.js:2182
scheduleTask @ zone.js:417
onScheduleTask @ core.mjs:6065
scheduleTask @ zone.js:411
onScheduleTask @ zone.js:273
scheduleTask @ zone.js:411
scheduleTask @ zone.js:207
scheduleMacroTask @ zone.js:230
scheduleMacroTaskWithCurrentZone @ zone.js:723
(anonymous) @ zone.js:2221
proto.<computed> @ zone.js:1038
(anonymous) @ module-BQ-7fJZl.mjs:2518
Observable2._trySubscribe @ Observable.js:33
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
(anonymous) @ switchMap.js:16
OperatorSubscriber2._this._next @ OperatorSubscriber.js:14
Subscriber2.next @ Subscriber.js:32
(anonymous) @ innerFrom.js:51
Observable2._trySubscribe @ Observable.js:33
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
(anonymous) @ switchMap.js:12
(anonymous) @ lift.js:10
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
(anonymous) @ finalize.js:5
(anonymous) @ lift.js:10
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
doInnerSub @ mergeInternals.js:21
outerNext @ mergeInternals.js:15
OperatorSubscriber2._this._next @ OperatorSubscriber.js:14
Subscriber2.next @ Subscriber.js:32
(anonymous) @ innerFrom.js:51
Observable2._trySubscribe @ Observable.js:33
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
mergeInternals @ mergeInternals.js:54
(anonymous) @ mergeMap.js:20
(anonymous) @ lift.js:10
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
(anonymous) @ filter.js:6
(anonymous) @ lift.js:10
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
(anonymous) @ map.js:6
(anonymous) @ lift.js:10
(anonymous) @ Observable.js:27
errorContext @ errorContext.js:23
Observable2.subscribe @ Observable.js:23
submitReschedule @ patient-appointments.component.ts:58
PatientAppointmentsComponent_div_4_Template_button_click_21_listener @ patient-appointments.component.ts:31
executeListenerWithErrorHandling @ core.mjs:29299
wrapListenerIn_markDirtyAndPreventDefault @ core.mjs:29282
(anonymous) @ dom_renderer-DGKzginR.mjs:709
invokeTask @ zone.js:431
(anonymous) @ core.mjs:6070
onInvokeTask @ core.mjs:6070
invokeTask @ zone.js:430
onInvokeTask @ core.mjs:6390
invokeTask @ zone.js:430
runTask @ zone.js:161
invokeTask @ zone.js:515
invokeTask @ zone.js:1141
globalCallback @ zone.js:1172
globalZoneAwareCallback @ zone.js:1205
Zone - HTMLButtonElement.addEventListener:click
onScheduleTask @ core.mjs:6064
scheduleTask @ zone.js:411
onScheduleTask @ zone.js:273
scheduleTask @ zone.js:411
scheduleTask @ zone.js:207
scheduleEventTask @ zone.js:233
(anonymous) @ zone.js:1498
addEventListener @ browser-D-u-fknz.mjs:164
addEventListener @ dom_renderer-DGKzginR.mjs:49
listen @ dom_renderer-DGKzginR.mjs:691
listenerInternal @ core.mjs:29478
ɵɵlistener @ core.mjs:29362
PatientAppointmentsComponent_div_4_Template @ patient-appointments.component.ts:31
executeTemplate @ core.mjs:12074
renderView @ core.mjs:12560
createAndRenderEmbeddedLView @ core.mjs:12627
createEmbeddedViewImpl @ core.mjs:14518
createEmbeddedView @ core.mjs:17717
(anonymous) @ common_module-Dx7dWex5.mjs:2762
forEachOperation @ core.mjs:36169
_applyChanges @ common_module-Dx7dWex5.mjs:2757
ngDoCheck @ common_module-Dx7dWex5.mjs:2752
callHookInternal @ core.mjs:4140
callHook @ core.mjs:4167
callHooks @ core.mjs:4124
executeInitAndCheckHooks @ core.mjs:4079
refreshView @ core.mjs:13689
recreate @ core.mjs:32495
executeWithInvalidateFallback @ core.mjs:32510
(anonymous) @ core.mjs:32501
invoke @ zone.js:398
onInvoke @ core.mjs:6401
invoke @ zone.js:397
run @ zone.js:113
run @ core.mjs:6253
recreateLView @ core.mjs:32501
recreateMatchingLViews @ core.mjs:32407
recreateMatchingLViews @ core.mjs:32421
recreateMatchingLViews @ core.mjs:32418
recreateMatchingLViews @ core.mjs:32421
ɵɵreplaceMetadata @ core.mjs:32354
(anonymous) @ patient-appointments.component.ts:13
invoke @ zone.js:398
run @ zone.js:113
(anonymous) @ zone.js:2537
invokeTask @ zone.js:431
runTask @ zone.js:161
drainMicroTaskQueue @ zone.js:612
Promise.then
nativeScheduleMicroTask @ zone.js:588
scheduleMicroTask @ zone.js:599
scheduleTask @ zone.js:420
scheduleTask @ zone.js:207
scheduleMicroTask @ zone.js:227
scheduleResolveOrReject @ zone.js:2527
resolvePromise @ zone.js:2461
(anonymous) @ zone.js:2369
(anonymous) @ zone.js:2385
Promise.then
(anonymous) @ zone.js:2779
ZoneAwarePromise @ zone.js:2701
Ctor.then @ zone.js:2778
PatientAppointmentsComponent_HmrLoad @ patient-appointments.component.ts:13
(anonymous) @ patient-appointments.component.ts:13
(anonymous) @ client:129
notifyListeners @ client:129
notifyListeners @ client:966
handleMessage @ client:909
onMessage @ client:299
(anonymous) @ client:429
patient-appointments.component.ts:65  Reschedule failed HttpErrorResponse {headers: _HttpHeaders, status: 406, statusText: 'OK', url: 'http://localhost:8002/appointment/update/undefined', ok: false, …}
<div class="container mt-5">
    <h2 class="text-center mb-4">Your Appointments</h2>
   
    <div *ngIf="appointments.length === 0" class="alert alert-info text-center">
      No appointments found.
    </div>
   
    <div *ngFor="let appt of appointments" class="card mb-3 shadow-sm">
      <div class="card-body">
        <h5 class="card-title">Doctor: {{ appt.doctor?.doctorName }}</h5>
        <p class="card-text">
          <strong>Specialization:</strong> {{ appt.doctor?.specialization }}<br />
          <strong>Date & Time:</strong> {{ appt.appointment?.appointmentDateTime }}<br />
          <strong>Status:</strong> {{ appt.appointment?.status }}<br />
          <strong>Reason:</strong> {{ appt.appointment?.reason }}
        </p>
   
        <div class="d-flex justify-content-end">
          <button class="btn btn-primary me-2" (click)="submitReschedule()">Reschedule</button>
          <button class="btn btn-danger" (click)="cancelAppointment(appt.appointment?.id)">Cancel</button>
        </div>
      </div>
    </div>
  </div>

-----------------------------------------------------------------
import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { AppointmentService } from '../appointment.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-patient-appointments',
  imports: [RouterLink,FormsModule,CommonModule],
  templateUrl: './patient-appointments.component.html',
  styleUrl: './patient-appointments.component.css'
})
export class PatientAppointmentsComponent implements OnInit{
   
    patientId = Number(localStorage.getItem("userId"));
    // patientId = 24;
    appointments: any[] = [];
   
    showModal = false;
    selectedAppointmentId: number = 0;
    rescheduleTime: string = '';
   
    constructor(private appointmentService: AppointmentService) {}
   
    ngOnInit(): void {
      this.loadAppointments();
    }
   
    loadAppointments() {
      this.appointmentService.getByPatientId(this.patientId).subscribe({
        next: (data) => this.appointments = data,
        error: (err) => console.error('Error fetching appointments', err)
      });
    }
   
    editAppointment(appt: any) {
      this.selectedAppointmentId = appt.appointment.id;
      this.rescheduleTime = appt.appointment.appointmentDateTime;
      this.showModal = true;
    }
   
    showRescheduleForm = false;
rescheduleData: any = {};
 
openReschedule(appointment: any) {
  this.rescheduleData = {
    id: appointment.appointment.id,
    patientId: appointment.appointment.patientId,
    doctorId: appointment.appointment.doctorId,
    appointmentDateTime: appointment.appointment.appointmentDateTime,
    reason: appointment.appointment.reason,
    status: appointment.appointment.status
  };
  this.showRescheduleForm = true;
}
 
submitReschedule() {
  this.appointmentService.updateAppointment(this.rescheduleData).subscribe({
    next: () => {
      alert('Appointment rescheduled successfully');
      this.loadAppointments();
      this.showRescheduleForm = false;
    },
    error: err => {
      console.error('Reschedule failed', err);
      alert('Failed to reschedule appointment');
    }
  });
}
 

    cancelAppointment(id: number) {
      if (confirm('Are you sure you want to cancel this appointment?')) {
        this.appointmentService.deleteAppointment(id).subscribe({
          next: () => {
            alert('Appointment cancelled');
            this.loadAppointments();
          },
          error: err => {
            console.error('Delete error', err);
            alert('Failed to cancel appointment');
          }
        });
      }
    }
  
  }
   
  
  
