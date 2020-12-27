export class EmployeeModel {
  public constructor(
    public employeeId?: number,
    public lastName?: string,
    public firstName?: string,
    public title?: string,
    public birthDate?: Date,
    public hireDate?: Date,
    public adress?: string,
    public postalCode?: number,
    public phone1?: string,
    public phone2?: string,
    public notes?: string,
    public photo?: string,
    public photoPath?: string,
    public idCard?: number,
    //david start
    public username?: string,
    public password?: string,
    public role?: string,
    public jwtToken?: string
    //david end
  ) { }
}
