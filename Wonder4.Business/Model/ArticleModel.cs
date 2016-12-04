using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    [Serializable]
    //nbers_articles
    [DataEntity(Alias = "nbers_articles")]
    public class ArticleModel:NbersBaseModel
    {
        /// <summary>
        /// title
        /// </summary>		
        private string _title;
        [DataColumn(Alias = "title")]
        public string title
        {
            get { return _title; }
            set { _title = value; }
        }
        /// <summary>
        /// art_type
        /// </summary>		
        private string _art_type;
        [DataColumn(Alias = "art_type")]
        public string art_type
        {
            get { return _art_type; }
            set { _art_type = value; }
        }
        /// <summary>
        /// art_type
        /// </summary>		
        private string _fkguid;
        [DataColumn(Alias = "fkguid")]
        public string fkguid
        {
            get { return _fkguid; }
            set { _fkguid = value; }
        }
        /// <summary>
        /// content
        /// </summary>		
        private string _content;
        [DataColumn(Alias = "content")]
        public string content
        {
            get { return _content; }
            set { _content = value; }
        }
        /// <summary>
        /// istop
        /// </summary>		
        private int _istop;
        [DataColumn(Alias = "istop")]
        public int istop
        {
            get { return _istop; }
            set { _istop = value; }
        }
        /// <summary>
        /// status
        /// </summary>		
        private int _status;
        [DataColumn(Alias = "status")]
        public int status
        {
            get { return _status; }
            set { _status = value; }
        }
        /// <summary>
        /// create_date
        /// </summary>		
        private DateTime _create_date;
        [DataColumn(Alias = "create_date")]
        public DateTime create_date
        {
            get { return _create_date; }
            set { _create_date = value; }
        }
        /// <summary>
        /// createby
        /// </summary>		
        private int _createby;
        [DataColumn(Alias = "createby")]
        public int createby
        {
            get { return _createby; }
            set { _createby = value; }
        }
        /// <summary>
        /// create_user
        /// </summary>		
        private string _create_user;
        [DataColumn(Alias = "create_user")]
        public string create_user
        {
            get { return _create_user; }
            set { _create_user = value; }
        }
        /// <summary>
        /// ispublish
        /// </summary>		
        private int _ispublish;
        [DataColumn(Alias = "ispublish")]
        public int ispublish
        {
            get { return _ispublish; }
            set { _ispublish = value; }
        }
        /// <summary>
        /// remark
        /// </summary>		
        private string _remark;
        [DataColumn(Alias = "remark")]
        public string remark
        {
            get { return _remark; }
            set { _remark = value; }
        }
        /// <summary>
        /// description
        /// </summary>		
        private string _description;
        [DataColumn(Alias = "description")]
        public string description
        {
            get { return _description; }
            set { _description = value; }
        }

    }
}