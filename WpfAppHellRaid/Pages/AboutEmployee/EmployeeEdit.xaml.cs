using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfAppHellRaid.Components;

namespace WpfAppHellRaid.Pages.AboutEmployee
{
    /// <summary>
    /// Логика взаимодействия для EmployeeEdit.xaml
    /// </summary>
    public partial class EmployeeEdit : Page
    {
        private Employee _employee;
        StringBuilder errorString = new StringBuilder();

        public EmployeeEdit(Employee employee)
        {
            InitializeComponent();
            _employee = employee;
            this.DataContext = employee;

            JobTitleCB.ItemsSource = App.DataBase.Job_title.ToList();
            JobTitleCB.DisplayMemberPath = "Name_jod_title";

            RankCB.ItemsSource = App.DataBase.Rank.ToList();
            RankCB.DisplayMemberPath = "Rank_name";

            ChefCB.ItemsSource = App.DataBase.Employee.Where(x => x.ID_jt == 1101).ToList();
            ChefCB.DisplayMemberPath = "SFP";

            ExtentCB.ItemsSource = App.DataBase.Extent.ToList();
            ExtentCB.DisplayMemberPath = "Extent_name";

            DepCB.ItemsSource = App.DataBase.Department.ToList();
            DepCB.DisplayMemberPath = "Dep_Name";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            int.TryParse(EXTB.Text, out int experience);
            int.TryParse(SalaryTB.Text, out int salary);
            if (!(experience >= 0 && experience <= 80))
                errorString.AppendLine("Не корректные данные о стаже работы. Измените их.");
            if (!(salary >= 40000 && salary <= 200000))
                errorString.AppendLine("Не корректные данные о заработной плате сотрудника.Измените их.");
            if (SFPTB.Text == "" || SFPTB.Text == null || SFPTB.Text == String.Empty)
                errorString.AppendLine("Введите инициалы сотрудника.");
            if (JobTitleCB.SelectedItem == null)
                errorString.AppendLine("Выберите должность сотрудника.");
            if (DepCB.SelectedItem == null)
                errorString.AppendLine("Выберите кафедру сотрудника.");
            if(ChefCB.SelectedItem == null)
                errorString.AppendLine("Выберите начальника сотруднику.");

            if (errorString.Length >0)
            {
                MessageBox.Show(errorString.ToString());
                errorString.Clear();
            }
            else
            {
                if (_employee.ID != 0)
                {
                    App.DataBase.SaveChanges();
                    ModernNavigation.NextPage(new PageComponent("Список сотрудников", new EmployeeList()));
                    MessageBox.Show("Данные изменены");
                }
                else
                {
                    App.DataBase.Employee.Add(new Employee()
                    {
                        ID_jt = (JobTitleCB.SelectedItem as Job_title).ID,
                        ID_extent = (ExtentCB.SelectedItem as Extent).ID,
                        ID_rank = (RankCB.SelectedItem as Rank).ID,
                        SFP = SFPTB.Text,
                        Salary = salary,
                        EmplEnable = true,
                        Experience = experience,
                        Chef = (ChefCB.SelectedItem as Employee).Chef,
                        ID_dep = (DepCB.SelectedItem as Department).ID
                    });
                    App.DataBase.SaveChanges();
                    ModernNavigation.NextPage(new PageComponent("Список дисциплин", new EmployeeList()));
                    MessageBox.Show("Данные сохранены");
                }
            }

        }
        private void OnlyDigits_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            EXTB.MaxLength = 2;
            SalaryTB.MaxLength = 6; 
            if (!Char.IsDigit(e.Text, 0))
                e.Handled = true;
        }

        
    }
}
