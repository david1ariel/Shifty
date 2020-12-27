import { Unsubscribe } from 'redux';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { AppRoutingModule } from 'src/app/app-routing.module';
import { ShiftTypeModel } from 'src/app/models/shift-type.model';
import { ShiftTypesService } from 'src/app/services/shift-types.service';
import { store } from 'src/app/redux/store';

@Component({
  selector: 'app-shift-types',
  templateUrl: './shift-types.component.html',
  styleUrls: ['./shift-types.component.css']
})
export class ShiftTypesComponent implements OnInit {

    constructor(public myShiftTypesService: ShiftTypesService, private http: HttpClient) { }

    public shiftTypes: ShiftTypeModel[];
    public router: AppRoutingModule;
    public unSubscribe: Unsubscribe;

    // dataSource = new MatTableDataSource();

    
    



    async ngOnInit() {
        this.unSubscribe = store.subscribe(() => {
            this.shiftTypes = store.getState().shiftTypes;
        })

        if (store.getState().shifts.length > 0) {
            this.shiftTypes = store.getState().shiftTypes;
        }
        else {

            try {
                await this.myShiftTypesService.getAllShiftTypes();
            }
            catch (err) {
                alert(err.message);
            }
        }
    }

    
    

    public async deleteShiftType(id: number) {
        try {
            const answer = confirm("Are you sure?");
            if (!answer) {
                return;
            }
            await this.myShiftTypesService.deleteShiftType(id);
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
