using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace LSSCBackEnd.Models
{
    public partial class lsscPortalContext : DbContext
    {
        public lsscPortalContext()
        {
        }

        public lsscPortalContext(DbContextOptions<lsscPortalContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TblAssessmentBatch> TblAssessmentBatch { get; set; }
        public virtual DbSet<TblAssessmentProof> TblAssessmentProof { get; set; }
        public virtual DbSet<TblCandidateList> TblCandidateList { get; set; }
        public virtual DbSet<TblCenter> TblCenter { get; set; }
        public virtual DbSet<TblClient> TblClient { get; set; }
        public virtual DbSet<TblFinalResult> TblFinalResult { get; set; }
        public virtual DbSet<TblNos> TblNos { get; set; }
        public virtual DbSet<TblPc> TblPc { get; set; }
        public virtual DbSet<TblPracticalQuestion> TblPracticalQuestion { get; set; }
        public virtual DbSet<TblPracticalResult> TblPracticalResult { get; set; }
        public virtual DbSet<TblProject> TblProject { get; set; }
        public virtual DbSet<TblQp> TblQp { get; set; }
        public virtual DbSet<TblQuestionBank> TblQuestionBank { get; set; }
        public virtual DbSet<TblQuestionPaperVersion> TblQuestionPaperVersion { get; set; }
        public virtual DbSet<TblTheoryQuestions> TblTheoryQuestions { get; set; }
        public virtual DbSet<TblTheoryResult> TblTheoryResult { get; set; }
        public virtual DbSet<TblTotalPracticalMarks> TblTotalPracticalMarks { get; set; }
        public virtual DbSet<TblTrainingPartner> TblTrainingPartner { get; set; }
        public virtual DbQuery<CenterAssesor> CenterAssesors { get; set; }

        public virtual DbQuery<practicalQuestions> PracticalQuestions { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=lsscPortal;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TblAssessmentBatch>(entity =>
            {
                entity.HasKey(e => e.AsId);

                entity.ToTable("tblAssessmentBatch");

                entity.Property(e => e.AsId).HasColumnName("asId");

                entity.Property(e => e.AsAssesmentEndtDate)
                    .HasColumnName("asAssesmentEndtDate")
                    .HasColumnType("date");

                entity.Property(e => e.AsAssesmentStartDate)
                    .HasColumnName("asAssesmentStartDate")
                    .HasColumnType("date");

                entity.Property(e => e.AsAssessmentEndTime).HasColumnName("asAssessmentEndTime");

                entity.Property(e => e.AsAssessmentStartTime).HasColumnName("asAssessmentStartTime");

                entity.Property(e => e.AsCenterId)
                    .IsRequired()
                    .HasColumnName("asCenterId")
                    .HasMaxLength(20);

                entity.Property(e => e.AsCity)
                    .IsRequired()
                    .HasColumnName("asCity")
                    .HasMaxLength(30);

                entity.Property(e => e.AsContactPerson)
                    .HasColumnName("asContactPerson")
                    .HasMaxLength(40);

                entity.Property(e => e.AsContactPersonEmailId)
                    .HasColumnName("asContactPersonEmailId")
                    .HasMaxLength(40);

                entity.Property(e => e.AsContactPersonPhoneNo).HasColumnName("asContactPersonPhoneNo");

                entity.Property(e => e.AsFacilitator)
                    .IsRequired()
                    .HasColumnName("asFacilitator")
                    .HasMaxLength(30);

                entity.Property(e => e.AsPartner)
                    .IsRequired()
                    .HasColumnName("asPartner")
                    .HasMaxLength(40);

                entity.Property(e => e.AsPracticalQuestionId).HasColumnName("asPracticalQuestionID");

                entity.Property(e => e.AsProjectId)
                    .IsRequired()
                    .HasColumnName("asProjectId")
                    .HasMaxLength(20);

                entity.Property(e => e.AsQpId)
                    .IsRequired()
                    .HasColumnName("asQpId")
                    .HasMaxLength(20);

                entity.Property(e => e.AsQuestionBankId).HasColumnName("asQuestionBankID");

                entity.Property(e => e.AsRegionalLang)
                    .HasColumnName("asRegionalLang")
                    .HasMaxLength(40);

                entity.Property(e => e.AsRemarks)
                    .HasColumnName("asRemarks")
                    .HasMaxLength(100);

                entity.Property(e => e.AsSdmsbatchName)
                    .IsRequired()
                    .HasColumnName("asSDMSBatchName")
                    .HasMaxLength(20);

                entity.Property(e => e.AsState)
                    .IsRequired()
                    .HasColumnName("asState")
                    .HasMaxLength(30);

                entity.Property(e => e.AsTheoryQuestionPaperVersion).HasColumnName("asTheoryQuestionPaperVersion");

                entity.Property(e => e.AsTrainingEndDate)
                    .HasColumnName("asTrainingEndDate")
                    .HasColumnType("date");

                entity.Property(e => e.AsTrainingStartDate)
                    .HasColumnName("asTrainingStartDate")
                    .HasColumnType("date");

                entity.Property(e => e.AsType)
                    .IsRequired()
                    .HasColumnName("asType")
                    .HasMaxLength(20);

                entity.HasOne(d => d.AsCenter)
                    .WithMany(p => p.TblAssessmentBatch)
                    .HasForeignKey(d => d.AsCenterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_assecenterID");

                entity.HasOne(d => d.AsPracticalQuestion)
                    .WithMany(p => p.TblAssessmentBatchAsPracticalQuestion)
                    .HasForeignKey(d => d.AsPracticalQuestionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_practicalQuestionVersion");

                entity.HasOne(d => d.AsProject)
                    .WithMany(p => p.TblAssessmentBatch)
                    .HasForeignKey(d => d.AsProjectId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_asseprojectID");

                entity.HasOne(d => d.AsQp)
                    .WithMany(p => p.TblAssessmentBatch)
                    .HasForeignKey(d => d.AsQpId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_asQP");

                entity.HasOne(d => d.AsQuestionBank)
                    .WithMany(p => p.TblAssessmentBatch)
                    .HasForeignKey(d => d.AsQuestionBankId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_qbID");

                entity.HasOne(d => d.AsTheoryQuestionPaperVersionNavigation)
                    .WithMany(p => p.TblAssessmentBatchAsTheoryQuestionPaperVersionNavigation)
                    .HasForeignKey(d => d.AsTheoryQuestionPaperVersion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TheorypaperVer");
            });

            modelBuilder.Entity<TblAssessmentProof>(entity =>
            {
                entity.HasKey(e => e.AsId);

                entity.ToTable("tblAssessmentProof");

                entity.Property(e => e.AsId).HasColumnName("asID");

                entity.Property(e => e.AsAddharPhoto).HasColumnName("asAddharPhoto");

                entity.Property(e => e.AsAssesser)
                    .HasColumnName("asAssesser")
                    .HasMaxLength(30);

                entity.Property(e => e.AsCandidateId)
                    .HasColumnName("asCandidateId")
                    .HasMaxLength(50);

                entity.Property(e => e.AsPersonalPhoto).HasColumnName("asPersonalPhoto");

                entity.Property(e => e.AsbatchId).HasColumnName("asbatchID");

                entity.HasOne(d => d.AsCandidate)
                    .WithMany(p => p.TblAssessmentProof)
                    .HasForeignKey(d => d.AsCandidateId)
                    .HasConstraintName("FK_candidateIDas");

                entity.HasOne(d => d.Asbatch)
                    .WithMany(p => p.TblAssessmentProof)
                    .HasForeignKey(d => d.AsbatchId)
                    .HasConstraintName("FK_batchIDas");
            });

            modelBuilder.Entity<TblCandidateList>(entity =>
            {
                entity.HasKey(e => e.ClEnrollmentNo);

                entity.ToTable("tblCandidateList");

                entity.Property(e => e.ClEnrollmentNo)
                    .HasColumnName("clEnrollmentNo")
                    .HasMaxLength(50)
                    .ValueGeneratedNever();

                entity.Property(e => e.ClName)
                    .IsRequired()
                    .HasColumnName("clName")
                    .HasMaxLength(50);

                entity.Property(e => e.ClPracticalDone)
                    .HasColumnName("clPracticalDone")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.ClReqNo).HasColumnName("clReqNo");

                entity.Property(e => e.ClTheoryDeone)
                    .HasColumnName("clTheoryDeone")
                    .HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<TblCenter>(entity =>
            {
                entity.HasKey(e => e.CenterCode);

                entity.ToTable("tblCenter");

                entity.Property(e => e.CenterCode)
                    .HasColumnName("centerCode")
                    .HasMaxLength(20)
                    .ValueGeneratedNever();

                entity.Property(e => e.CenterAddress)
                    .HasColumnName("centerAddress")
                    .HasMaxLength(100);

                entity.Property(e => e.CenterContactNo).HasColumnName("centerContactNo");

                entity.Property(e => e.CenterContactPerson)
                    .HasColumnName("centerContactPerson")
                    .HasMaxLength(30);

                entity.Property(e => e.CenterEmailId)
                    .HasColumnName("centerEmailID")
                    .HasMaxLength(40);

                entity.Property(e => e.CenterName)
                    .IsRequired()
                    .HasColumnName("centerName")
                    .HasMaxLength(40);

                entity.Property(e => e.CenterTpId).HasColumnName("centerTpID");

                entity.HasOne(d => d.CenterTp)
                    .WithMany(p => p.TblCenter)
                    .HasForeignKey(d => d.CenterTpId)
                    .HasConstraintName("FK_tpID");
            });

            modelBuilder.Entity<TblClient>(entity =>
            {
                entity.HasKey(e => e.ClientId);

                entity.ToTable("tblClient");

                entity.Property(e => e.ClientId)
                    .HasColumnName("clientId")
                    .HasMaxLength(20)
                    .ValueGeneratedNever();

                entity.Property(e => e.ClientActive).HasColumnName("clientActive");

                entity.Property(e => e.ClientAddress)
                    .HasColumnName("clientAddress")
                    .HasMaxLength(100);

                entity.Property(e => e.ClientContactNo).HasColumnName("clientContactNo");

                entity.Property(e => e.ClientContactPerson)
                    .HasColumnName("clientContactPerson")
                    .HasMaxLength(30);

                entity.Property(e => e.ClientEmailId)
                    .HasColumnName("clientEmailID")
                    .HasMaxLength(40);

                entity.Property(e => e.ClientName)
                    .IsRequired()
                    .HasColumnName("clientName")
                    .HasMaxLength(40);
            });

            modelBuilder.Entity<TblFinalResult>(entity =>
            {
                entity.HasKey(e => e.FrId);

                entity.ToTable("tblFinalResult");

                entity.Property(e => e.FrId).HasColumnName("frID");

                entity.Property(e => e.FrCandidateId)
                    .IsRequired()
                    .HasColumnName("frCandidateId")
                    .HasMaxLength(50);

                entity.Property(e => e.FrFinalResult).HasColumnName("frFinalResult");

                entity.Property(e => e.FrPracticalId).HasColumnName("frPracticalID");

                entity.Property(e => e.FrPracticalResult).HasColumnName("frPracticalResult");

                entity.Property(e => e.FrTheoryId).HasColumnName("frTheoryID");

                entity.Property(e => e.FrTheoryResult).HasColumnName("frTheoryResult");

                entity.Property(e => e.FrbatchId).HasColumnName("frbatchID");

                entity.HasOne(d => d.FrCandidate)
                    .WithMany(p => p.TblFinalResult)
                    .HasForeignKey(d => d.FrCandidateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_candidateIDfr");

                entity.HasOne(d => d.FrPractical)
                    .WithMany(p => p.TblFinalResult)
                    .HasForeignKey(d => d.FrPracticalId)
                    .HasConstraintName("FK_PracticalResultIDfr");

                entity.HasOne(d => d.FrTheory)
                    .WithMany(p => p.TblFinalResult)
                    .HasForeignKey(d => d.FrTheoryId)
                    .HasConstraintName("FK_theoryResultIDfr");

                entity.HasOne(d => d.Frbatch)
                    .WithMany(p => p.TblFinalResult)
                    .HasForeignKey(d => d.FrbatchId)
                    .HasConstraintName("FK_batchIDfr");
            });

            modelBuilder.Entity<TblNos>(entity =>
            {
                entity.HasKey(e => e.NosCode);

                entity.ToTable("tblNOS");

                entity.Property(e => e.NosCode)
                    .HasColumnName("nosCode")
                    .HasMaxLength(20)
                    .ValueGeneratedNever();

                entity.Property(e => e.NosActive).HasColumnName("nosActive");

                entity.Property(e => e.NosDesp)
                    .HasColumnName("nosDesp")
                    .HasMaxLength(10);

                entity.Property(e => e.NosName)
                    .HasColumnName("nosName")
                    .HasMaxLength(100);

                entity.Property(e => e.NosQpCode)
                    .HasColumnName("nosQpCode")
                    .HasMaxLength(20);

                entity.HasOne(d => d.NosQpCodeNavigation)
                    .WithMany(p => p.TblNos)
                    .HasForeignKey(d => d.NosQpCode)
                    .HasConstraintName("FK_nosQpConn");
            });

            modelBuilder.Entity<TblPc>(entity =>
            {
                entity.HasKey(e => e.PcCode);

                entity.ToTable("tblPC");

                entity.Property(e => e.PcCode)
                    .HasColumnName("pcCode")
                    .HasMaxLength(20)
                    .ValueGeneratedNever();

                entity.Property(e => e.PcActive).HasColumnName("pcActive");

                entity.Property(e => e.PcDescp)
                    .HasColumnName("pcDescp")
                    .HasMaxLength(40);

                entity.Property(e => e.PcName)
                    .IsRequired()
                    .HasColumnName("pcName")
                    .HasMaxLength(20);

                entity.Property(e => e.PcNoscode)
                    .HasColumnName("pcNOSCode")
                    .HasMaxLength(20);

                entity.HasOne(d => d.PcNoscodeNavigation)
                    .WithMany(p => p.TblPc)
                    .HasForeignKey(d => d.PcNoscode)
                    .HasConstraintName("FK_pcNosConn");
            });

            modelBuilder.Entity<TblPracticalQuestion>(entity =>
            {
                entity.HasKey(e => e.PqCode);

                entity.ToTable("tblPracticalQuestion");

                entity.Property(e => e.PqCode).HasColumnName("pqCode");

                entity.Property(e => e.PqMarks).HasColumnName("pqMarks");

                entity.Property(e => e.PqNos)
                    .IsRequired()
                    .HasColumnName("pqNOS")
                    .HasMaxLength(20);

                entity.Property(e => e.PqQuestion)
                    .IsRequired()
                    .HasColumnName("pqQuestion")
                    .HasMaxLength(200);

                entity.Property(e => e.PqType)
                    .IsRequired()
                    .HasColumnName("pqType")
                    .HasMaxLength(30);

                entity.Property(e => e.PqVersionOfQb).HasColumnName("pqVersionOfQB");

                entity.HasOne(d => d.PqNosNavigation)
                    .WithMany(p => p.TblPracticalQuestion)
                    .HasForeignKey(d => d.PqNos)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_nosOfPQ");

                entity.HasOne(d => d.PqVersionOfQbNavigation)
                    .WithMany(p => p.TblPracticalQuestion)
                    .HasForeignKey(d => d.PqVersionOfQb)
                    .HasConstraintName("FK_versionIDOfQB");
            });

            modelBuilder.Entity<TblPracticalResult>(entity =>
            {
                entity.HasKey(e => e.PrId);

                entity.ToTable("tblPracticalResult");

                entity.Property(e => e.PrId).HasColumnName("prID");

                entity.Property(e => e.PrCandidateId)
                    .IsRequired()
                    .HasColumnName("prCandidateId")
                    .HasMaxLength(50);

                entity.Property(e => e.PrMarks).HasColumnName("prMarks");

                entity.Property(e => e.PrQuestionId).HasColumnName("prQuestionID");

                entity.Property(e => e.PrbatchId).HasColumnName("prbatchID");

                entity.HasOne(d => d.PrCandidate)
                    .WithMany(p => p.TblPracticalResult)
                    .HasForeignKey(d => d.PrCandidateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_candidateIDPR");

                entity.HasOne(d => d.PrQuestion)
                    .WithMany(p => p.TblPracticalResult)
                    .HasForeignKey(d => d.PrQuestionId)
                    .HasConstraintName("FK_questionIDPR");

                entity.HasOne(d => d.Prbatch)
                    .WithMany(p => p.TblPracticalResult)
                    .HasForeignKey(d => d.PrbatchId)
                    .HasConstraintName("FK_batchIDPR");
            });

            modelBuilder.Entity<TblProject>(entity =>
            {
                entity.HasKey(e => e.ProjId);

                entity.ToTable("tblProject");

                entity.Property(e => e.ProjId)
                    .HasColumnName("projId")
                    .HasMaxLength(20)
                    .ValueGeneratedNever();

                entity.Property(e => e.ProjAssesmentType)
                    .HasColumnName("projAssesmentType")
                    .HasMaxLength(20);

                entity.Property(e => e.ProjClientId)
                    .HasColumnName("projClientId")
                    .HasMaxLength(20);

                entity.Property(e => e.ProjDesp)
                    .HasColumnName("projDesp")
                    .HasMaxLength(100);

                entity.Property(e => e.ProjManager)
                    .IsRequired()
                    .HasColumnName("projManager")
                    .HasMaxLength(30);

                entity.Property(e => e.ProjName)
                    .IsRequired()
                    .HasColumnName("projName")
                    .HasMaxLength(40);

                entity.HasOne(d => d.ProjClient)
                    .WithMany(p => p.TblProject)
                    .HasForeignKey(d => d.ProjClientId)
                    .HasConstraintName("FK_clientID");
            });

            modelBuilder.Entity<TblQp>(entity =>
            {
                entity.HasKey(e => e.QpCode);

                entity.ToTable("tblQP");

                entity.Property(e => e.QpCode)
                    .HasColumnName("qpCode")
                    .HasMaxLength(20)
                    .ValueGeneratedNever();

                entity.Property(e => e.QpActive).HasColumnName("qpActive");

                entity.Property(e => e.QpDesp)
                    .HasColumnName("qpDesp")
                    .HasMaxLength(100);

                entity.Property(e => e.QpMaxEdlevel)
                    .HasColumnName("qpMaxEDLevel")
                    .HasMaxLength(30);

                entity.Property(e => e.QpMinEdlevel)
                    .HasColumnName("qpMinEDLevel")
                    .HasMaxLength(30);

                entity.Property(e => e.QpName)
                    .IsRequired()
                    .HasColumnName("qpName")
                    .HasMaxLength(50);

                entity.Property(e => e.QpNoOfNos).HasColumnName("qpNoOfNOS");

                entity.Property(e => e.QpNsqfLevel).HasColumnName("qpNsqfLevel");

                entity.Property(e => e.QpSectorName)
                    .HasColumnName("qpSectorName")
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<TblQuestionBank>(entity =>
            {
                entity.HasKey(e => e.QbCode);

                entity.ToTable("tblQuestionBank");

                entity.Property(e => e.QbCode).HasColumnName("qbCode");

                entity.Property(e => e.QbName)
                    .IsRequired()
                    .HasColumnName("qbName")
                    .HasMaxLength(100);

                entity.Property(e => e.QbRelatedQp)
                    .HasColumnName("qbRelatedQP")
                    .HasMaxLength(20);

                entity.HasOne(d => d.QbRelatedQpNavigation)
                    .WithMany(p => p.TblQuestionBank)
                    .HasForeignKey(d => d.QbRelatedQp)
                    .HasConstraintName("FK_qbQpConn");
            });

            modelBuilder.Entity<TblQuestionPaperVersion>(entity =>
            {
                entity.HasKey(e => e.QvId);

                entity.ToTable("tblQuestionPaperVersion");

                entity.Property(e => e.QvId).HasColumnName("qvId");

                entity.Property(e => e.QvBangali)
                    .HasColumnName("qvBangali")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.QvEnglish)
                    .HasColumnName("qvEnglish")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.QvHindi)
                    .HasColumnName("qvHindi")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.QvName)
                    .IsRequired()
                    .HasColumnName("qvName")
                    .HasMaxLength(50);

                entity.Property(e => e.QvQlId).HasColumnName("qvQlId");

                entity.Property(e => e.QvTamil)
                    .HasColumnName("qvTamil")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.QvType)
                    .IsRequired()
                    .HasColumnName("qvType")
                    .HasMaxLength(30);

                entity.HasOne(d => d.QvQl)
                    .WithMany(p => p.TblQuestionPaperVersion)
                    .HasForeignKey(d => d.QvQlId)
                    .HasConstraintName("FK_QBidversionRel");
            });

            modelBuilder.Entity<TblTheoryQuestions>(entity =>
            {
                entity.HasKey(e => e.TqCode);

                entity.ToTable("tblTheoryQuestions");

                entity.Property(e => e.TqCode).HasColumnName("tqCode");

                entity.Property(e => e.TqBengaliOption1)
                    .HasColumnName("tqBengaliOption1")
                    .HasMaxLength(500);

                entity.Property(e => e.TqBengaliOption2)
                    .HasColumnName("tqBengaliOption2")
                    .HasMaxLength(500);

                entity.Property(e => e.TqBengaliOption3)
                    .HasColumnName("tqBengaliOption3")
                    .HasMaxLength(500);

                entity.Property(e => e.TqBengaliOption4)
                    .HasColumnName("tqBengaliOption4")
                    .HasMaxLength(500);

                entity.Property(e => e.TqBengaliQuestion)
                    .HasColumnName("tqBengaliQuestion")
                    .HasMaxLength(500);

                entity.Property(e => e.TqCorrectAnswer).HasColumnName("tqCorrectAnswer");

                entity.Property(e => e.TqHindiOption1)
                    .HasColumnName("tqHindiOption1")
                    .HasMaxLength(500);

                entity.Property(e => e.TqHindiOption2)
                    .HasColumnName("tqHindiOption2")
                    .HasMaxLength(500);

                entity.Property(e => e.TqHindiOption3)
                    .HasColumnName("tqHindiOption3")
                    .HasMaxLength(500);

                entity.Property(e => e.TqHindiOption4)
                    .HasColumnName("tqHindiOption4")
                    .HasMaxLength(500);

                entity.Property(e => e.TqHindiQuestion)
                    .HasColumnName("tqHindiQuestion")
                    .HasMaxLength(500);

                entity.Property(e => e.TqImg).HasColumnName("tqImg");

                entity.Property(e => e.TqMarks).HasColumnName("tqMarks");

                entity.Property(e => e.TqOption1)
                    .IsRequired()
                    .HasColumnName("tqOption1")
                    .HasMaxLength(500);

                entity.Property(e => e.TqOption2)
                    .IsRequired()
                    .HasColumnName("tqOption2")
                    .HasMaxLength(500);

                entity.Property(e => e.TqOption3)
                    .IsRequired()
                    .HasColumnName("tqOption3")
                    .HasMaxLength(500);

                entity.Property(e => e.TqOption4)
                    .IsRequired()
                    .HasColumnName("tqOption4")
                    .HasMaxLength(500);

                entity.Property(e => e.TqQuestion)
                    .IsRequired()
                    .HasColumnName("tqQuestion")
                    .HasMaxLength(500);

                entity.Property(e => e.TqTamilOption1)
                    .HasColumnName("tqTamilOption1")
                    .HasMaxLength(500);

                entity.Property(e => e.TqTamilOption2)
                    .HasColumnName("tqTamilOption2")
                    .HasMaxLength(500);

                entity.Property(e => e.TqTamilOption3)
                    .HasColumnName("tqTamilOption3")
                    .HasMaxLength(500);

                entity.Property(e => e.TqTamilOption4)
                    .HasColumnName("tqTamilOption4")
                    .HasMaxLength(500);

                entity.Property(e => e.TqTamilQuestion)
                    .HasColumnName("tqTamilQuestion")
                    .HasMaxLength(500);

                entity.Property(e => e.TqVersionOfQb).HasColumnName("tqVersionOfQB");

                entity.HasOne(d => d.TqVersionOfQbNavigation)
                    .WithMany(p => p.TblTheoryQuestions)
                    .HasForeignKey(d => d.TqVersionOfQb)
                    .HasConstraintName("FK_versionID");
            });

            modelBuilder.Entity<TblTheoryResult>(entity =>
            {
                entity.HasKey(e => e.TrId);

                entity.ToTable("tblTheoryResult");

                entity.Property(e => e.TrId).HasColumnName("trID");

                entity.Property(e => e.TrCandidateId)
                    .IsRequired()
                    .HasColumnName("trCandidateId")
                    .HasMaxLength(50);

                entity.Property(e => e.TrMarks1).HasColumnName("trMarks1");

                entity.Property(e => e.TrMarks10).HasColumnName("trMarks10");

                entity.Property(e => e.TrMarks11).HasColumnName("trMarks11");

                entity.Property(e => e.TrMarks12).HasColumnName("trMarks12");

                entity.Property(e => e.TrMarks13).HasColumnName("trMarks13");

                entity.Property(e => e.TrMarks14).HasColumnName("trMarks14");

                entity.Property(e => e.TrMarks15).HasColumnName("trMarks15");

                entity.Property(e => e.TrMarks16).HasColumnName("trMarks16");

                entity.Property(e => e.TrMarks17).HasColumnName("trMarks17");

                entity.Property(e => e.TrMarks18).HasColumnName("trMarks18");

                entity.Property(e => e.TrMarks19).HasColumnName("trMarks19");

                entity.Property(e => e.TrMarks2).HasColumnName("trMarks2");

                entity.Property(e => e.TrMarks20).HasColumnName("trMarks20");

                entity.Property(e => e.TrMarks3).HasColumnName("trMarks3");

                entity.Property(e => e.TrMarks4).HasColumnName("trMarks4");

                entity.Property(e => e.TrMarks5).HasColumnName("trMarks5");

                entity.Property(e => e.TrMarks6).HasColumnName("trMarks6");

                entity.Property(e => e.TrMarks7).HasColumnName("trMarks7");

                entity.Property(e => e.TrMarks8).HasColumnName("trMarks8");

                entity.Property(e => e.TrMarks9).HasColumnName("trMarks9");

                entity.Property(e => e.TrTotalMarks).HasColumnName("trTotalMarks");

                entity.Property(e => e.TrbatchId).HasColumnName("trbatchID");

                entity.HasOne(d => d.TrCandidate)
                    .WithMany(p => p.TblTheoryResult)
                    .HasForeignKey(d => d.TrCandidateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_candidate");

                entity.HasOne(d => d.Trbatch)
                    .WithMany(p => p.TblTheoryResult)
                    .HasForeignKey(d => d.TrbatchId)
                    .HasConstraintName("FK_batchID");
            });

            modelBuilder.Entity<TblTotalPracticalMarks>(entity =>
            {
                entity.HasKey(e => e.TpmId);

                entity.ToTable("tblTotalPracticalMarks");

                entity.Property(e => e.TpmId).HasColumnName("tpmID");

                entity.Property(e => e.TpmCandidateId)
                    .IsRequired()
                    .HasColumnName("tpmCandidateId")
                    .HasMaxLength(50);

                entity.Property(e => e.TpmTotalMarks).HasColumnName("tpmTotalMarks");

                entity.Property(e => e.TpmbatchId).HasColumnName("tpmbatchID");

                entity.HasOne(d => d.TpmCandidate)
                    .WithMany(p => p.TblTotalPracticalMarks)
                    .HasForeignKey(d => d.TpmCandidateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_candidateIDtpm");

                entity.HasOne(d => d.Tpmbatch)
                    .WithMany(p => p.TblTotalPracticalMarks)
                    .HasForeignKey(d => d.TpmbatchId)
                    .HasConstraintName("FK_batchIDtpm");
            });

            modelBuilder.Entity<TblTrainingPartner>(entity =>
            {
                entity.HasKey(e => e.TpCode);

                entity.ToTable("tblTrainingPartner");

                entity.Property(e => e.TpCode).HasColumnName("tpCode");

                entity.Property(e => e.TpActive).HasColumnName("tpActive");

                entity.Property(e => e.TpName)
                    .HasColumnName("tpName")
                    .HasMaxLength(50);
            });
        }
    }
}
