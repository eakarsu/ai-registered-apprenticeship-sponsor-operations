export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-registered-apprenticeship-sponsor-operations",
  "title": "Registered Apprenticeship Sponsor Operations",
  "tagline": "Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence.",
    "entities": [
      "ApprenticeshipProgram",
      "Apprentice",
      "WorkProcess"
    ],
    "workflows": [
      "training-evidence-mapping",
      "work-process-gap-summary"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence.",
    "entities": [
      "WorkHourEntry",
      "InstructionCourse",
      "InstructionAttendance"
    ],
    "workflows": [
      "mentor-review-preparation",
      "wage-progression-brief"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence.",
    "entities": [
      "MentorAttestation",
      "WageStep",
      "CompletionPacket"
    ],
    "workflows": [
      "instruction-plan-draft",
      "completion-packet-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "ApprenticeshipProgram": {
    "name": "ApprenticeshipProgram",
    "label": "Apprenticeship Program",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "registrationNumber",
        "kind": "string"
      },
      {
        "name": "occupation",
        "kind": "string"
      },
      {
        "name": "sponsor",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "completionHours",
        "kind": "number"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "Apprentice": {
    "name": "Apprentice",
    "label": "Apprentice",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "apprenticeNumber",
        "kind": "string"
      },
      {
        "name": "employer",
        "kind": "string"
      },
      {
        "name": "startedAt",
        "kind": "date"
      },
      {
        "name": "mentor",
        "kind": "string"
      },
      {
        "name": "targetEndAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "WorkProcess": {
    "name": "WorkProcess",
    "label": "Work Process",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "code",
        "kind": "string"
      },
      {
        "name": "requiredHours",
        "kind": "number"
      },
      {
        "name": "description",
        "kind": "string"
      },
      {
        "name": "sequence",
        "kind": "number"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "WorkHourEntry": {
    "name": "WorkHourEntry",
    "label": "Work Hour Entry",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "apprenticeId",
        "kind": "string"
      },
      {
        "name": "workProcessId",
        "kind": "string"
      },
      {
        "name": "workedAt",
        "kind": "date"
      },
      {
        "name": "hours",
        "kind": "number"
      },
      {
        "name": "supervisor",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "InstructionCourse": {
    "name": "InstructionCourse",
    "label": "Instruction Course",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "provider",
        "kind": "string"
      },
      {
        "name": "requiredHours",
        "kind": "number"
      },
      {
        "name": "topic",
        "kind": "string"
      },
      {
        "name": "scheduledAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "InstructionAttendance": {
    "name": "InstructionAttendance",
    "label": "Instruction Attendance",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "apprenticeId",
        "kind": "string"
      },
      {
        "name": "instructionCourseId",
        "kind": "string"
      },
      {
        "name": "attendedAt",
        "kind": "date"
      },
      {
        "name": "hours",
        "kind": "number"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "MentorAttestation": {
    "name": "MentorAttestation",
    "label": "Mentor Attestation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "apprenticeId",
        "kind": "string"
      },
      {
        "name": "mentor",
        "kind": "string"
      },
      {
        "name": "competency",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "attestedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "WageStep": {
    "name": "WageStep",
    "label": "Wage Step",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "hoursThreshold",
        "kind": "number"
      },
      {
        "name": "requiredRateCents",
        "kind": "number"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "agreementVersion",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "CompletionPacket": {
    "name": "CompletionPacket",
    "label": "Completion Packet",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "apprenticeId",
        "kind": "string"
      },
      {
        "name": "compiledAt",
        "kind": "date"
      },
      {
        "name": "sponsorNotes",
        "kind": "string"
      },
      {
        "name": "supportingEvidence",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "apprenticeshipProgramId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "training-evidence-mapping",
    "title": "Training evidence mapping",
    "description": "Training evidence mapping using selected apprenticeship program records and supplied evidence.",
    "prompt": "Training evidence mapping for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "work-process-gap-summary",
    "title": "Work-process gap summary",
    "description": "Work-process gap summary using selected apprenticeship program records and supplied evidence.",
    "prompt": "Work-process gap summary for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "mentor-review-preparation",
    "title": "Mentor review preparation",
    "description": "Mentor review preparation using selected apprenticeship program records and supplied evidence.",
    "prompt": "Mentor review preparation for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "wage-progression-brief",
    "title": "Wage progression brief",
    "description": "Wage progression brief using selected apprenticeship program records and supplied evidence.",
    "prompt": "Wage progression brief for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "instruction-plan-draft",
    "title": "Instruction plan draft",
    "description": "Instruction plan draft using selected apprenticeship program records and supplied evidence.",
    "prompt": "Instruction plan draft for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "completion-packet-narrative",
    "title": "Completion packet narrative",
    "description": "Completion packet narrative using selected apprenticeship program records and supplied evidence.",
    "prompt": "Completion packet narrative for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected apprenticeship program records and supplied evidence.",
    "prompt": "Evidence completeness review for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected apprenticeship program records and supplied evidence.",
    "prompt": "Operations handoff draft for Registered Apprenticeship Sponsor Operations. Operational scope: Track work-process hours, related instruction, mentor attestations, wage progression and completion evidence. Specific AI scope: Map training evidence to program requirements for sponsor review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
