using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;
using System.Xml;

namespace ProyectoXSLT
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // declaro una variable global
        public string tipocars = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Label1.Text = "Hola desde el servidor (codebehind)";

            // recuperar una variable que viene desde la url
            //para ello valido si existe un a variabke llamada Id dentro de la url
            // si no existe, pasamos un 0 de lo contrario recupere el valor

            if (Request.QueryString["Id"] == null)
            {
                tipocars = "0";

            }
            else
            {

                tipocars = Request.QueryString["Id"];


            }

            TransdormarXML();


        }

        private void TransdormarXML()
        {
            //recuperar las rutas de nuestros XML Y XSLT

            string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/cars.xml";
            string xslPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/template.xslt";

            //Llenar el archivo XML (en la parte de arriba, necesitamos los using de "System.Xml")
            XmlTextReader xmlTextReader = new XmlTextReader(xmlPath);

            //configuramos las credenciales para resolver el recursos externos como el XSLT
            XmlUrlResolver resolver = new XmlUrlResolver();
            resolver.Credentials = CredentialCache.DefaultCredentials;

            //crear las configuraciones para poder acceder al XSLT
            // los parametros "true" son para tratar al documento XSLT como si fuese un documento y asi poder trasformarlo
            XsltSettings settings = new XsltSettings(true, true);


            //leemos el archivo XSLT y lo cargamos para trasformarlo
            XslCompiledTransform xsl = new XslCompiledTransform();
            xsl.Load(xslPath, settings, resolver);

            //creamos un StringBuilder para almacenar el resultado de la trasformacion
            StringBuilder stringBuilder = new StringBuilder();
            TextWriter tWriter = new StringWriter(stringBuilder);

            //configuramos los argumentos para la trasformacion
            XsltArgumentList xslArgumentList = new XsltArgumentList();
            // pasamos la variable del tipocars al XSLT
            xslArgumentList.AddParam("TipoCars", "", tipocars);

            //trasformamos el xml -> HTML usando XSLT
            xsl.Transform(xmlTextReader, xslArgumentList, tWriter);

            //obtenemos el resultado de la trasformacion como una sola cadenaq
            string resultado = stringBuilder.ToString();

            //escribimos el resultado como respuesta como respuesta HTTP
            Response.Write(resultado);










        }





    }
}
