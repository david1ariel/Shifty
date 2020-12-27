import { HomePageImageComponent } from './components/home-page-image/home-page-image.component';
import { SubmitShiftsComponent } from './components/submit-shifts/submit-shifts.component';
import { ShiftsComponent } from './components/shifts/shifts.component';
import { AddBusinessComponent } from './components/add-business/add-business.component';
import { ManagerGuard } from './services/manager.guard';
import { UpdateEmployeeComponent } from './components/update-employee/update-employee.component';
import { AdminGuard } from './services/admin.guard';
import { LogoutComponent } from './components/logout/logout.component';
import { LoginComponent } from './components/login/login.component';
import { LoginGuardService } from './services/login-guard.service';
import { AddEmployeeComponent } from './components/add-employee/add-employee.component';// david
import { EmployeesComponent } from './components/employees/employees.component';//david
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { AboutComponent } from './components/about/about.component';
import { HomeComponent } from './components/home/home.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


const routes: Routes = [
    {path:"home", component: HomeComponent},
    {path:"about", component: AboutComponent},
    
    {path:"admin/add-business", canActivate: [AdminGuard], component: AddBusinessComponent},//david
    {path:"employees", canActivate: [ManagerGuard], component: EmployeesComponent},//david
    {path:"employees/new", canActivate: [ManagerGuard], component: AddEmployeeComponent},//david
    {path:"edit-employee/:employeeId", canActivate: [LoginGuardService], component: UpdateEmployeeComponent},//david
    {path:"login", component: LoginComponent},//david
    {path:"login/screen-logo", component: HomePageImageComponent},//david
    {path:"logout", component: LogoutComponent},//david
    {path:"shifts", canActivate: [ManagerGuard], component: ShiftsComponent},//david
    {path:"submit-shifts", canActivate: [LoginGuardService], component: SubmitShiftsComponent},//david



    {path:"", redirectTo: "/home", pathMatch:"full"},
    {path:"**", component: PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
