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

            JobTitleCB.ItemsSource = App.DataBase.Employee.ToList();
            JobTitleCB.DisplayMemberPath = "Name_jod_title";

            RankCB.ItemsSource = App.DataBase.Employee.ToList();
            RankCB.DisplayMemberPath = "Rank";

            ExtentTB.ItemsSource = App.DataBase.Employee.ToList();
            ExtentTB.DisplayMemberPath = "Extent";

            ChefCB.ItemsSource = App.DataBase.Auditorium.ToList();
            ChefCB.DisplayMemberPath = "SFP";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (SFPTB.Text == "" || SFPTB.Text == null || SFPTB.Text == String.Empty)
                errorString.AppendLine("");
            if (EXTB.Text == || EXTB.Text == )
                errorString.AppendLine("");
            if (SalaryTB.Text == || SalaryTB.Text == )
                errorString.AppendLine("");
            if (RankCB.Text =="")
                errorString.AppendLine("");
            if (JobTitleCB.Text =="")
                errorString.AppendLine("");
            if (ExtentTB.Text =="")
                errorString.AppendLine("");

        }
    }
}
