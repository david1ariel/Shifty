import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ShiftModel } from 'src/app/models/shift.model';
import { ShiftsService } from 'src/app/services/shifts.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-add-shift',
  templateUrl: './add-shift.component.html',
  styleUrls: ['./add-shift.component.css']
})
export class AddShiftComponent{

    public shift = new ShiftModel();

    constructor(private myShiftsService: ShiftsService, private myRouter: Router) { }
  
    public async addShift(){
      try {
          this.shift = await this.myShiftsService.addShift(this.shift);
          alert("Shift has been added. ID: "+ this.shift.shiftId);
          
          this.myRouter.navigateByUrl(environment.pastShiftsBaseUrl);
      } catch (error) {
          console.log(error.message);
      }      
    }

}
