import { ShiftModel } from './../../models/shift.model';
import { ShiftsService } from './../../services/shifts.service';
import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AppRoutingModule } from 'src/app/app-routing.module';
import { Unsubscribe } from 'redux';
import { store } from 'src/app/redux/store';

@Component({
  selector: 'app-shifts',
  templateUrl: './shifts.component.html',
  styleUrls: ['./shifts.component.css']
})
export class ShiftsComponent implements OnInit {

    constructor(public myShiftsService: ShiftsService, private http: HttpClient) { }

    public shifts: ShiftModel[];
    public router: AppRoutingModule;
    public unSubscribe: Unsubscribe;

    // dataSource = new MatTableDataSource();

    
    



    async ngOnInit() {
        this.unSubscribe = store.subscribe(() => {
            this.shifts = store.getState().shifts;
        })

        if (store.getState().shifts.length > 0) {
            this.shifts = store.getState().shifts;
        }
        else {

            try {
                await this.myShiftsService.getAllShifts();
            }
            catch (err) {
                alert(err.message);
            }
        }
    }

    
    

    public async deleteShift(id: number) {
        try {
            const answer = confirm("Are you sure?");
            if (!answer) {
                return;
            }
            await this.myShiftsService.deleteShift(id);
            alert('The product has been deleted');
            location.reload();


        } catch (error) {
            alert(error.message);
        }

        
    }


    // displayedColumns: string[] = 
    // [
    //     'First name', 
    //     'Larst name', 
    //     'Title', 
    //     'Birts Date', 
    //     'Hire Date'
    // ];
    

    // @ViewChild(MatSort) sort: MatSort;

    
    // ngAfterViewInit(): void {
    //     this.dataSource.sort = this.sort;
    // }

    async ngOnDestroy() {
        await this.unSubscribe();
    }

}
