using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using NationalInstruments.NI4882;

namespace GPIB_Forms_App
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            

        }

        private void QueryInstrumentButton_Click(object sender, EventArgs e)
        {
            //NationalInstruments.NI4882.Device ni = new NationalInstruments.NI4882.Device(0, 2);
            //ni.Write("*IDN?");
            //string s = ni.ReadString();
        }
        string sineGen;
        private void button1_Click(object sender, EventArgs e)
        {
            string s;
            Agilent.Open();                      //Opens the socket
            //Agilent.WriteLine("SYST:REM");
            //System.Threading.Thread.Sleep(2000);
            Agilent.WriteLine("*IDN?");          //Write the command *IDN? to the device.
            System.Threading.Thread.Sleep(1000); //Sleep to help have command reach the device
            s = Agilent.ReadLine();              //Stores data found as a response
            System.Threading.Thread.Sleep(4000); //Sleep to help have command reach the device
            response.Text = s;                   //Sets the label to the return value from the socket
            Agilent.Close();                     //Closes the socket
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Agilent.Open();                     //Opens the socket
            Agilent.WriteLine("SYST:REM");      //Sets the device to remote
            Agilent.Close();                    //Close the socket
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Agilent.Open();
                //Opens Serial Port to Waveform Generator
            Agilent.WriteLine("SYST:REM");//Sets the device to remote
            System.Threading.Thread.Sleep(1000);
            //Sets the operation mode to Remote
            sineGen = "APPL:SIN " + freqBox.Text + ", " + ampBox.Text;
            //Generates command to send using user chosen values
            Agilent.WriteLine(sineGen);
            System.Threading.Thread.Sleep(1000);
            //Generates sine wave with specific freq and amp chosen by user
            Agilent.Close();
                //Closes the serial port
        }
    }
}
