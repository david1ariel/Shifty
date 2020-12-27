import { ActionType } from './../redux/action-type';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { store } from '../redux/store';
import { EmployeeModel } from '../models/employee.model';

@Injectable({
    providedIn: 'root'
})
export class EmployeesService {

    constructor(private http: HttpClient) { }

    public async getAllEmployees(): Promise<boolean> {
        try {
            const employees = await this.http.get<EmployeeModel[]>(environment.employeesBaseUrl).toPromise();
            store.dispatch({ type: ActionType.GetAllEmployees, payload: employees });
            return true;
        }
        catch (httpErrorResponse) {
            store.dispatch({ type: ActionType.GotError, payload: httpErrorResponse });
            return false;
        }
    }
    
    public addEmployee(employee: EmployeeModel): Promise<EmployeeModel> {
        const observable = this.http.post<EmployeeModel>(environment.employeesBaseUrl, employee);
        store.dispatch({ type: ActionType.AddEmployee, payload: employee });
        return observable.toPromise();
    }

    public async getOneEmployee(id: number): Promise<EmployeeModel> {
        const observable = await this.http.get<EmployeeModel>(environment.employeesBaseUrl + "/" + id);
        return observable.toPromise();
    }

    public updateEmployee(employee: EmployeeModel): Observable<EmployeeModel> {
        const observable = this.http.put<EmployeeModel>(environment.employeesBaseUrl + "/" + employee.employeeId, employee);
        store.dispatch({type: ActionType.UpdateEmployee, payload: employee})
        return observable;
    }

    public deleteEmployee(id: number): Promise<undefined> {
        const observable = this.http.delete<undefined>(environment.employeesBaseUrl + "/" +id);
        store.dispatch({type: ActionType.DeleteEmployee, payload: id})
        return observable.toPromise();
    }
}
