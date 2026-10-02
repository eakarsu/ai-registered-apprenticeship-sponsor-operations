-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApprenticeshipProgram" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "registrationNumber" TEXT NOT NULL,
    "occupation" TEXT NOT NULL,
    "sponsor" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "completionHours" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ApprenticeshipProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Apprentice" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "apprenticeNumber" TEXT NOT NULL,
    "employer" TEXT NOT NULL,
    "startedAt" TIMESTAMP(3) NOT NULL,
    "mentor" TEXT NOT NULL,
    "targetEndAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Apprentice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkProcess" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "requiredHours" DOUBLE PRECISION NOT NULL,
    "description" TEXT NOT NULL,
    "sequence" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WorkProcess_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkHourEntry" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "apprenticeId" TEXT NOT NULL,
    "workProcessId" TEXT NOT NULL,
    "workedAt" TIMESTAMP(3) NOT NULL,
    "hours" DOUBLE PRECISION NOT NULL,
    "supervisor" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WorkHourEntry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InstructionCourse" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "requiredHours" DOUBLE PRECISION NOT NULL,
    "topic" TEXT NOT NULL,
    "scheduledAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InstructionCourse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InstructionAttendance" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "apprenticeId" TEXT NOT NULL,
    "instructionCourseId" TEXT NOT NULL,
    "attendedAt" TIMESTAMP(3) NOT NULL,
    "hours" DOUBLE PRECISION NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InstructionAttendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MentorAttestation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "apprenticeId" TEXT NOT NULL,
    "mentor" TEXT NOT NULL,
    "competency" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "attestedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MentorAttestation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WageStep" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "hoursThreshold" DOUBLE PRECISION NOT NULL,
    "requiredRateCents" INTEGER NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "agreementVersion" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WageStep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompletionPacket" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "apprenticeId" TEXT NOT NULL,
    "compiledAt" TIMESTAMP(3) NOT NULL,
    "sponsorNotes" TEXT NOT NULL,
    "supportingEvidence" TEXT NOT NULL,
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CompletionPacket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "apprenticeshipProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "ApprenticeshipProgram_createdAt_idx" ON "ApprenticeshipProgram"("createdAt");

-- CreateIndex
CREATE INDEX "Apprentice_createdAt_idx" ON "Apprentice"("createdAt");

-- CreateIndex
CREATE INDEX "Apprentice_apprenticeshipProgramId_idx" ON "Apprentice"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "WorkProcess_createdAt_idx" ON "WorkProcess"("createdAt");

-- CreateIndex
CREATE INDEX "WorkProcess_apprenticeshipProgramId_idx" ON "WorkProcess"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "WorkHourEntry_createdAt_idx" ON "WorkHourEntry"("createdAt");

-- CreateIndex
CREATE INDEX "WorkHourEntry_apprenticeshipProgramId_idx" ON "WorkHourEntry"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "InstructionCourse_createdAt_idx" ON "InstructionCourse"("createdAt");

-- CreateIndex
CREATE INDEX "InstructionCourse_apprenticeshipProgramId_idx" ON "InstructionCourse"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "InstructionAttendance_createdAt_idx" ON "InstructionAttendance"("createdAt");

-- CreateIndex
CREATE INDEX "InstructionAttendance_apprenticeshipProgramId_idx" ON "InstructionAttendance"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "MentorAttestation_createdAt_idx" ON "MentorAttestation"("createdAt");

-- CreateIndex
CREATE INDEX "MentorAttestation_apprenticeshipProgramId_idx" ON "MentorAttestation"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "WageStep_createdAt_idx" ON "WageStep"("createdAt");

-- CreateIndex
CREATE INDEX "WageStep_apprenticeshipProgramId_idx" ON "WageStep"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "CompletionPacket_createdAt_idx" ON "CompletionPacket"("createdAt");

-- CreateIndex
CREATE INDEX "CompletionPacket_apprenticeshipProgramId_idx" ON "CompletionPacket"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_apprenticeshipProgramId_idx" ON "OperationalTask"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_apprenticeshipProgramId_idx" ON "RuleVersion"("apprenticeshipProgramId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_apprenticeshipProgramId_idx" ON "DocumentRequirement"("apprenticeshipProgramId");

-- AddForeignKey
ALTER TABLE "Apprentice" ADD CONSTRAINT "Apprentice_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkProcess" ADD CONSTRAINT "WorkProcess_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkHourEntry" ADD CONSTRAINT "WorkHourEntry_apprenticeId_fkey" FOREIGN KEY ("apprenticeId") REFERENCES "Apprentice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkHourEntry" ADD CONSTRAINT "WorkHourEntry_workProcessId_fkey" FOREIGN KEY ("workProcessId") REFERENCES "WorkProcess"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkHourEntry" ADD CONSTRAINT "WorkHourEntry_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionCourse" ADD CONSTRAINT "InstructionCourse_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionAttendance" ADD CONSTRAINT "InstructionAttendance_apprenticeId_fkey" FOREIGN KEY ("apprenticeId") REFERENCES "Apprentice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionAttendance" ADD CONSTRAINT "InstructionAttendance_instructionCourseId_fkey" FOREIGN KEY ("instructionCourseId") REFERENCES "InstructionCourse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionAttendance" ADD CONSTRAINT "InstructionAttendance_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MentorAttestation" ADD CONSTRAINT "MentorAttestation_apprenticeId_fkey" FOREIGN KEY ("apprenticeId") REFERENCES "Apprentice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MentorAttestation" ADD CONSTRAINT "MentorAttestation_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WageStep" ADD CONSTRAINT "WageStep_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompletionPacket" ADD CONSTRAINT "CompletionPacket_apprenticeId_fkey" FOREIGN KEY ("apprenticeId") REFERENCES "Apprentice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompletionPacket" ADD CONSTRAINT "CompletionPacket_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_apprenticeshipProgramId_fkey" FOREIGN KEY ("apprenticeshipProgramId") REFERENCES "ApprenticeshipProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

