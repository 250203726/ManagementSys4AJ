using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    //nbers_Attachments
    [DataEntity(Alias = "nbers_Attachments")]
    public class AttachmentsModel:NbersBaseModel
    {
        /// <summary>
        /// DocName
        /// </summary>		
        private string _docname;
        [DataColumn(Alias = "DocName")]
        public string DocName
        {
            get { return _docname; }
            set { _docname = value; }
        }
        /// <summary>
        /// FkGUID
        /// </summary>		
        private int _fkguid;
        [DataColumn(Alias = "FkGUID")]
        public int FkGUID
        {
            get { return _fkguid; }
            set { _fkguid = value; }
        }
        /// <summary>
        /// CreateBy
        /// </summary>		
        private int _createby;
        [DataColumn(Alias = "CreateBy")]
        public int CreateBy
        {
            get { return _createby; }
            set { _createby = value; }
        }
        /// <summary>
        /// CreateUser
        /// </summary>		
        private string _createuser;
        [DataColumn(Alias = "CreateUser")]
        public string CreateUser
        {
            get { return _createuser; }
            set { _createuser = value; }
        }
        /// <summary>
        /// CreateOn
        /// </summary>		
        private DateTime _createon;
        [DataColumn(Alias = "CreateOn")]
        public DateTime CreateOn
        {
            get { return _createon; }
            set { _createon = value; }
        }
        /// <summary>
        /// FileName
        /// </summary>		
        private string _filename;
        [DataColumn(Alias = "FileName")]
        public string FileName
        {
            get { return _filename; }
            set { _filename = value; }
        }
        /// <summary>
        /// Location
        /// </summary>		
        private string _location;
        [DataColumn(Alias = "Location")]
        public string Location
        {
            get { return _location; }
            set { _location = value; }
        }
        /// <summary>
        /// Filesize
        /// </summary>		
        private string _filesize;
        [DataColumn(Alias = "Filesize")]
        public string Filesize
        {
            get { return _filesize; }
            set { _filesize = value; }
        }
        /// <summary>
        /// URL
        /// </summary>		
        private string _url;
        [DataColumn(Alias = "URL")]
        public string URL
        {
            get { return _url; }
            set { _url = value; }
        }
        /// <summary>
        /// DocType
        /// </summary>		
        private string _doctype;
        [DataColumn(Alias = "DocType")]
        public string DocType
        {
            get { return _doctype; }
            set { _doctype = value; }
        }
        /// <summary>
        /// Remarks
        /// </summary>		
        private string _remarks;
        [DataColumn(Alias = "Remarks")]
        public string Remarks
        {
            get { return _remarks; }
            set { _remarks = value; }
        }

    }
}